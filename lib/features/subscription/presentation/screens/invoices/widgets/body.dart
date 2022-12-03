part of '../invoice_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  Future openFile({required String url, String? fileName}) async {
    List urlSplit = url.split(':');
    String httpsUrl = 'https:${urlSplit[1]}';
    final file = await downloadFile(httpsUrl, fileName!);
    if (file == null) return;

    print('Path: ${file.path}');

    OpenFilex.open(file.path);
  }

  void fetchInvoice() async {
    String token = context.read<UserCubit>().state.user.token;
    await context.read<InvoiceCubit>().allInvoices(token);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchInvoice();
  }

  @override
  Widget build(BuildContext context) {
    List<Invoice> invoices = context.watch<InvoiceCubit>().state.invoices;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 1000,
              child: Table(
                border: TableBorder.all(),
                children: [
                  buildRow(['TITLE', 'AMOUNT', 'DATE', '']),
                  ...invoices
                      .map((invoice) => TableRow(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: 200,
                                child: Column(
                                  children: [
                                    Text(invoice.title),
                                    Text(invoice.desc),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(invoice.amount),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(invoice.date),
                              ),
                              TextButton(
                                child: const Text('Download'),
                                onPressed: () => openFile(
                                    url: invoice.url, fileName: 'invoice.pdf'),
                              ),
                            ],
                          ))
                      .toList()
                ],
              ),
            ),
    );
  }

  TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(cell),
              ))
          .toList());
}
