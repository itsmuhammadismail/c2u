part of '../add_job_screen.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Trade> trades = [];
  List<Region> regions = [];
  List<Subbie> subbies = [];

  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
  ];
  List<Object?> _selectedAnimals = [];

  bool isPageLoaded = false;

  List<Object?> selectedTrade = [], selectedRegion = [], selectedSubbie = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    String token = context.read<UserCubit>().state.user.token;
    await fetchTrades(token);
    await fetchRegions(token);
    await fetchSubbies(token);
    setState(() {
      isPageLoaded = true;
    });
  }

  Future<void> fetchTrades(String token) async {
    List<Trade> myTrade = await context.read<UserCubit>().getTrades(token);
    setState(() {
      trades = myTrade;
      // selectedTrade = trades[0].trade;
    });
  }

  Future<void> fetchSubbies(String token) async {
    List<Subbie> mySubbies = await context.read<UserCubit>().getSubbies(token);
    setState(() {
      subbies = mySubbies;
      // selectedSubbie = subbies[0].name;
    });
  }

  Future<void> fetchRegions(String token) async {
    List<Region> myRegion = await context.read<UserCubit>().getRegions(token);
    setState(() {
      regions = myRegion;
      // selectedRegion = regions[0].region;
    });
  }

  final _titleController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _jobDescController = TextEditingController();

  String workOrder = "";

  DateTime? startDate = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _onSubmit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      setState(() {
        isLoading = true;
      });

      String token = context.read<UserCubit>().state.user.token;
      int id = context.read<UserCubit>().state.user.id;

      String regionId = "", tradeId = "", assignId = "";
      for (int i = 0; i < selectedRegion.length; i++) {
        Region newRegion = selectedRegion[i] as Region;
        regionId += '${newRegion.regionId},';
      }

      for (int i = 0; i < selectedTrade.length; i++) {
        Trade newRade = selectedTrade[i] as Trade;
        tradeId += '${newRade.tradeId},';
      }
      for (int i = 0; i < selectedSubbie.length; i++) {
        Subbie newSubbie = selectedSubbie[i] as Subbie;
        assignId += '${newSubbie.id},';
      }
      regionId = regionId.substring(0, regionId.length - 1);
      tradeId = tradeId.substring(0, tradeId.length - 1);
      assignId = assignId.substring(0, assignId.length - 1);
      print(selectedRegion);
      print(selectedSubbie);

      bool res = await context.read<JobsCubit>().createJob(CreateJobParams(
            token: token,
            contractor: id.toString(),
            trade: tradeId.toString(),
            region: regionId.toString(),
            title: _titleController.text,
            address: _addressController.text,
            city: _cityController.text,
            state: _stateController.text,
            postalCode: _postalCodeController.text,
            startDate: DateFormat('yyyy-MM-dd').format(startDate!),
            description: _jobDescController.text,
            status: 'assigned',
            assignJob: assignId.toString(),
            documents: workOrder,
          ));

      setState(() {
        isLoading = false;
      });

      if (!res) {
        // _currentPasswordController.clear();
        // _passwordController.clear();
        // _confirmPasswordController.clear();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Alert(
              heading: 'Failed!',
              body: 'Something went wrong',
            );
          },
        );
      } else {
        // const snackBar = SnackBar(
        //   content: Text('Job Created Successfully!'),
        // );

        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigate.to(context, JobListScreen.id);
      }
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: isPageLoaded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...buildTextField("Title *", _titleController),
                  ...buildTextArea("Address *", _addressController),
                  ...buildTextField("City *", _cityController),
                  ...buildTextField("State *", _stateController),
                  ...buildTextField("Postal Code *", _postalCodeController),
                  DateSelector(
                    name: 'Start Date *',
                    onChange: (date) {
                      startDate = date;
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: Button(
                      color: const Color(0xFF967904),
                      child: const Text('Choose File'),
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: [
                            'ppt',
                            'pptx',
                            'doc',
                            'docx',
                            'pdf',
                            'txt'
                          ],
                        );
                        print('path ${result?.files.single.path}');
                        if (result != null) {
                          workOrder = result.files.single.path!;
                          print('workOrder $workOrder');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...buildTextArea("Job Description", _jobDescController,
                      required: false),
                  // ...buildDropdown(
                  //   "Region *",
                  //   regions.map((e) => e.region).toList(),
                  //   selectedRegion,
                  //   (value) => setState(() {
                  //     selectedRegion = value;
                  //   }),
                  // ),
                  // ...buildDropdown(
                  //   "Trade *",
                  //   trades.map((e) => e.trade).toList(),
                  //   selectedTrade,
                  //   (value) => setState(() {
                  //     selectedTrade = value;
                  //   }),
                  // ),
                  // ...buildDropdown(
                  //   "Assign Job *",
                  //   subbies.map((e) => e.name).toList(),
                  //   selectedSubbie,
                  //   (value) => setState(() {
                  //     selectedSubbie = value;
                  //   }),
                  // ),
                  Text("Region *"),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: kTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: MultiSelectDialogField(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      items: regions
                          .map((e) => MultiSelectItem(e, e.region))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedRegion = values;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Trades *"),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: kTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: MultiSelectDialogField(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      items: trades
                          .map((e) => MultiSelectItem(e, e.trade))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedTrade = values!;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Assign Job *"),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: kTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: MultiSelectDialogField(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      items: subbies
                          .map((e) => MultiSelectItem(e, e.name))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedSubbie = values;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Add Job"),
                        onPressed: () => _onSubmit()),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  List<Widget> buildTextField(String name, TextEditingController controller,
      {bool required = true}) {
    return [
      Text(name),
      const SizedBox(height: 5),
      MyTextField(
        hintText: "",
        controller: controller,
        required: required,
        onChange: (value) {},
      ),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> buildTextArea(String name, TextEditingController controller,
      {bool required = true}) {
    return [
      Text(name),
      const SizedBox(height: 5),
      MyTextArea(
        hintText: "",
        controller: controller,
        required: required,
        onChange: (value) {},
      ),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> buildDropdown(
      String name, List<String> items, String selected, onChange) {
    return [
      Text(name),
      const SizedBox(height: 5),
      SizedBox(
        width: double.infinity,
        child: MyDropdown(
          items: items,
          selected: selected,
          onChange: (value) {
            onChange(value);
          },
        ),
      ),
      const SizedBox(height: 20),
    ];
  }
}
