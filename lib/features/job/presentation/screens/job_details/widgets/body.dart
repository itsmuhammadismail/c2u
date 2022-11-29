part of '../job_details_screen.dart';


class Body extends StatefulWidget {
  final Job job;
  const Body({required this.job, Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.job.day);

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

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.job.name,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE6207).withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  widget.job.status.capitalize(),
                  style: const TextStyle(color: Color(0xFFE24E06)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.job.contractor,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              // Text(
              //   '\$150 - \$200',
              //   style: TextStyle(fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/map_pin.svg',
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.job.state,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/time.svg',
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeago.format(date).capitalize(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Description',
            style: kHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            widget.job.desc,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          widget.job.workOrder != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Work Order',
                      style: kHeading3,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      // onTap: () =>
                      //     requestDownload(widget.job.workOrder!, 'workorder'),
                      onTap: () => openFile(
                          url: widget.job.workOrder!,
                          fileName: 'workorder.pdf'),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFECD07),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: const [
                            Text('Check Work Order'),
                            Spacer(),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
