part of "../subbie_profile_screen.dart";

class Body extends StatefulWidget {
  final List<Trade> trade;
  final List<Region> region;
  const Body({required this.trade, required this.region, Key? key})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  int activeStep = 0; // Initial step set to 5.

  int upperBound = 4;

  // Account Information
  final tradingName = TextEditingController();
  final abn = TextEditingController();
  String gstRegistered = "1";
  String businessStructure = "company";
  final businessAddressLine1 = TextEditingController();
  final businessAddressLine2 = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();

  // Contact Details
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final otherNumber = TextEditingController();
  final email = TextEditingController();
  final website = TextEditingController();
  String profileImage = "";

  // Trade Information
  String availableEmergency = "Normal Hours Only";

  // Insurance and Licensing
  final liabilityCompany = TextEditingController();
  final liabilityPolicyNumber = TextEditingController();
  DateTime? expiryDate = DateTime.now();
  final valueOfCover = TextEditingController();
  String certificateCurrency = "";
  final constructionSafetyCardNumber = TextEditingController();
  String constructionSaftyCard = "";
  final drivingLicenceNumber = TextEditingController();
  String drivingLicence = "";
  DateTime? drivingLicenceExpiryDate = DateTime.now();
  final regulatoryBodyLicenceNumber = TextEditingController();
  DateTime? regulatoryBodyExpiryDate = DateTime.now();

  String regulatoryBodyLicence = "";
  final workCoverPolicyNumber = TextEditingController();
  DateTime? workCoverExpiryDate = DateTime.now();
  String workCoverCertificateCurrency = "";
  String localLegislation = "1";
  String swms = "";
  String subbieCapabilityDocument = "";
  final notes = TextEditingController();

  bool _isChecked = false;
  String _currText = '';

  void _onSubmit() async {
    final form = _formKey.currentState;

    print("in form ");

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      List<String> myTrades = widget.trade
          .where((element) => element.checked == true)
          .toList()
          .map((e) => e.tradeId.toString())
          .toList();
      String tradeString = myTrades
          .toString()
          .substring(1, myTrades.toString().length - 1)
          .replaceAll(" ", "");

      List<String> myRanges = widget.region
          .where((element) => element.checked == true)
          .toList()
          .map((e) => e.regionId.toString())
          .toList();
      String rangeString = myRanges
          .toString()
          .substring(1, myRanges.toString().length - 1)
          .replaceAll(" ", "");

      String token = context.read<UserCubit>().state.user.token;

      ProfileModel profile = ProfileModel(
        tradingName: tradingName.text,
        abn: abn.text,
        gstRegistered: gstRegistered,
        businessStructure: businessStructure,
        businessAddressLine1: businessAddressLine1.text,
        businessAddressLine2: businessAddressLine2.text,
        city: city.text,
        state: state.text,
        postalCode: postalCode.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phoneNumber: phoneNumber.text,
        otherNumber: otherNumber.text,
        email: email.text,
        website: website.text,
        profileImage: profileImage,
        trades: tradeString,
        regions: rangeString,
        availableEmergency: availableEmergency,
        liabilityCompany: liabilityCompany.text,
        liabilityPolicyNumber: liabilityPolicyNumber.text,
        expiryDate: DateFormat('yyyy-MM-dd').format(expiryDate!),
        valueOfCover: valueOfCover.text,
        certificateCurrency: certificateCurrency,
        constructionSafetyCardNumber: constructionSafetyCardNumber.text,
        constructionSaftyCard: constructionSaftyCard,
        drivingLicence: drivingLicence,
        drivingLicenceNumber: drivingLicenceNumber.text,
        drivingLicenceExpiryDate:
            DateFormat('yyyy-MM-dd').format(drivingLicenceExpiryDate!),
        regulatoryBodyLicenceNumber: regulatoryBodyLicenceNumber.text,
        regulatoryBodyExpiryDate:
            DateFormat('yyyy-MM-dd').format(regulatoryBodyExpiryDate!),
        regulatoryBodyLicence: regulatoryBodyLicence,
        workCoverPolicyNumber: workCoverPolicyNumber.text,
        workCoverExpiryDate:
            DateFormat('yyyy-MM-dd').format(workCoverExpiryDate!),
        workCoverCertificateCurrency: workCoverCertificateCurrency,
        localLegislation: localLegislation,
        swms: swms,
        subbieCapabilityDocument: subbieCapabilityDocument,
        notes: notes.text,
      );

      setState(() => isLoading = true);
      String res =
          await context.read<UserCubit>().updateProfile(token, profile);
      setState(() => isLoading = false);
      print('res $res');
      if (res != '0') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Alert(
              heading: 'Profile Update Failed!',
              body: 'Something went wrong',
            );
          },
        );
      } else {
        const snackBar = SnackBar(
          content: Text('Your Profile has been updated successfully'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      form.save();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          IconStepper(
            icons: [
              Icon(
                Icons.article,
                color: activeStep == 0 ? Colors.white : kPrimaryColor,
              ),
              Icon(
                Icons.perm_contact_calendar,
                color: activeStep == 1 ? Colors.white : kPrimaryColor,
              ),
              Icon(
                Icons.account_balance,
                color: activeStep == 2 ? Colors.white : kPrimaryColor,
              ),
              Icon(
                Icons.verified_user,
                color: activeStep == 3 ? Colors.white : kPrimaryColor,
              ),
            ],

            enableNextPreviousButtons: false,
            activeStepColor: kPrimaryColor,
            activeStepBorderColor: kPrimaryColor,
            stepColor: Colors.grey.withOpacity(0.3),

            lineColor: kPrimaryColor,

            stepRadius: 32,
            lineLength: 25,

            // activeStep property set to activeStep variable defined above.
            activeStep: activeStep,

            // This ensures step-tapping updates the activeStep.
            onStepReached: (index) {
              setState(() {
                activeStep = index;
              });
            },
          ),
          activeStep == 0 ? buildAccountInformation() : const SizedBox(),
          activeStep == 1 ? buildContactDetails() : const SizedBox(),
          activeStep == 2 ? buildTradeInformation() : const SizedBox(),
          activeStep == 3 ? buildInsurance() : const SizedBox(),
          activeStep < 3
              ? Button(
                  child: const Text("Next"),
                  onPressed: () => setState(() => activeStep++))
              : Button(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Finish"),
                  onPressed: () => _onSubmit(),
                ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildAccountInformation() {
    return TextFieldContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...buildHeading("Account Information"),
          ...buildTextField("Trading Name", tradingName),
          ...buildTextField("ABN", abn),
          const Text("Is the entity GST Registered"),
          Row(
            children: [
              Radio(
                value: "1",
                groupValue: gstRegistered,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value.toString();
                  });
                },
              ),
              const Text("Yes"),
              const SizedBox(width: 30),
              Radio(
                value: "2",
                groupValue: gstRegistered,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value.toString();
                  });
                },
              ),
              const Text("No"),
            ],
          ),
          const SizedBox(height: 20),
          const Text("What is the business structure"),
          Row(
            children: [
              Radio(
                value: "company",
                groupValue: businessStructure,
                onChanged: (value) {
                  setState(() {
                    businessStructure = value.toString();
                  });
                },
              ),
              const Text("Company"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "trust",
                groupValue: businessStructure,
                onChanged: (value) {
                  setState(() {
                    businessStructure = value.toString();
                  });
                },
              ),
              const Text("Trust"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "sole-trader",
                groupValue: businessStructure,
                onChanged: (value) {
                  setState(() {
                    businessStructure = value.toString();
                  });
                },
              ),
              const Text("Sole Trader"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "partnership",
                groupValue: businessStructure,
                onChanged: (value) {
                  setState(() {
                    businessStructure = value.toString();
                  });
                },
              ),
              const Text("Partnership"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "other",
                groupValue: businessStructure,
                onChanged: (value) {
                  setState(() {
                    businessStructure = value.toString();
                  });
                },
              ),
              const Text("Other"),
            ],
          ),
          const SizedBox(height: 20),
          ...buildTextField("Business Address (Line 1)", businessAddressLine1),
          ...buildTextField("Business Address (Line 2)", businessAddressLine2),
          ...buildTextField("City", city),
          ...buildTextField("State", state),
          ...buildTextField("Postal Code", postalCode),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildContactDetails() {
    return TextFieldContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...buildHeading("Contact Details"),
        ...buildTextField("Director's First Name", firstName),
        ...buildTextField("Director's Last Name", lastName),
        ...buildTextField("Main Contact Phone Number", phoneNumber),
        ...buildTextField("Other Contact Number", otherNumber, required: false),
        ...buildTextField("Main Email", email),
        ...buildTextField("Website if Applicable", website, required: false),
        const Text('Profile Image'),
        const SizedBox(height: 5),
        SizedBox(
          width: 150,
          child: Button(
            color: const Color(0xFF967904),
            child: const Text('Choose File'),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['png', 'jpg', 'jpeg'],
              );
              if (result != null) {
                profileImage = result.files.single.path!;
              }
            },
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  Widget buildTradeInformation() {
    return TextFieldContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...buildHeading("Trade Information"),
        const Text(
            "Please select the traders you are licensed and world like to complete works for *"),
        const SizedBox(height: 5),
        Column(
          children: widget.trade
              .map((t) => CheckboxListTile(
                    value: t.checked,
                    title: Text(t.trade),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      setState(() {
                        t.checked = val!;
                        if (val == true) {
                          _currText = t.tradeId.toString();
                        }
                      });
                    },
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        const Text(
            "Please select the regions you are able to complete works / supply *"),
        const SizedBox(height: 5),
        Column(
          children: widget.region
              .map((t) => CheckboxListTile(
                    value: t.checked,
                    title: Text(t.region),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      setState(() {
                        t.checked = val!;
                        if (val == true) {
                          _currText = t.regionId.toString();
                        }
                      });
                    },
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        const Text(
            "Are you available for make safes & emergency work, if so please answer below"),
        const SizedBox(height: 5),
        Row(
          children: [
            Radio(
              value: "Normal Hours Only",
              groupValue: availableEmergency,
              onChanged: (value) {
                setState(() {
                  availableEmergency = value.toString();
                });
              },
            ),
            const Text("Normal Hours Only"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: "All Hours",
              groupValue: availableEmergency,
              onChanged: (value) {
                setState(() {
                  availableEmergency = value.toString();
                });
              },
            ),
            const Text("All Hours"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: "No",
              groupValue: availableEmergency,
              onChanged: (value) {
                setState(() {
                  availableEmergency = value.toString();
                });
              },
            ),
            const Text("No"),
          ],
        ),
        const SizedBox(height: 10),
      ]),
    );
  }

  Widget buildInsurance() {
    return TextFieldContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...buildHeading("Insurance and Licensing"),
          ...buildTextField("Public Liability Company", liabilityCompany),
          ...buildTextField(
              "Public Liability Policy Number", liabilityPolicyNumber),
          DateSelector(
            name: 'Expiry Date *',
            onChange: (date) {
              expiryDate = date;
            },
          ),
          ...buildTextField(
              "Value of Cover in \$ (eg 20000000) *", valueOfCover),
          const Text('Public Liability Certificate of Currency Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  certificateCurrency = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ...buildTextField("Construction Safety Card Number *",
              constructionSafetyCardNumber),
          const Text('Construction Safety Card Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  constructionSaftyCard = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ...buildTextField(
              "Directors Drivers Lincense Number *", drivingLicenceNumber),
          DateSelector(
            name: 'Directors Drivers Lincense Expiry Date *',
            onChange: (date) {
              drivingLicenceExpiryDate = date;
            },
          ),
          const Text('Directors Drivers Lincense Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  drivingLicence = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ...buildTextField("Regulatory Body License Number (eg QBCC, NSW) *",
              regulatoryBodyLicenceNumber),
          DateSelector(
            name: 'Regulatory Body Expiry Date *',
            onChange: (date) {
              regulatoryBodyExpiryDate = date;
            },
          ),
          const Text('Regulatory Body License File Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  regulatoryBodyLicence = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ...buildTextField(
              "Work Cover Policy Number *", workCoverPolicyNumber),
          DateSelector(
            name: 'Work Cover Expiry Date *',
            onChange: (date) {
              workCoverExpiryDate = date;
            },
          ),
          const Text('Work Cover Certificate of Currency File Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  workCoverCertificateCurrency = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
              "Do you have safe work method statements in line with local legislation? *"),
          Row(
            children: [
              Radio(
                value: "1",
                groupValue: localLegislation,
                onChanged: (value) {
                  setState(() {
                    localLegislation = value.toString();
                  });
                },
              ),
              const Text("Yes"),
              const SizedBox(width: 30),
              Radio(
                value: "2",
                groupValue: localLegislation,
                onChanged: (value) {
                  setState(() {
                    localLegislation = value.toString();
                  });
                },
              ),
              const Text("No"),
            ],
          ),
          const SizedBox(height: 10),
          const Text('SWMS File Upload *'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  swms = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
              'Capacity statements / other Associated documents including rates if applicable'),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Button(
              color: const Color(0xFF967904),
              child: const Text('Choose File'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                if (result != null) {
                  subbieCapabilityDocument = result.files.single.path!;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ...buildTextArea(
              "Any other notes / rates in relation to your services offering including rates if applicable",
              notes),
        ],
      ),
    );
  }

  List<Widget> buildHeading(String heading) {
    return [
      const SizedBox(height: 30),
      Text(
        heading,
        style: kHeading3,
      ),
      const SizedBox(height: 30)
    ];
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

  List<Widget> buildTextArea(String name, TextEditingController controller) {
    return [
      Text(name),
      const SizedBox(height: 5),
      MyTextArea(
        hintText: "",
        controller: controller,
        required: false,
        onChange: (value) {},
      ),
      const SizedBox(height: 20),
    ];
  }
}
