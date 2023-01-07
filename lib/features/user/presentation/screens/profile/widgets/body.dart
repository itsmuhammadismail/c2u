part of "../profile_screen.dart";

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? image = null;
  File? fileImage;
  String? imagePath = null;
  String avatarName = '';

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailControlller = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _otherNumberController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _abnController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();

  bool isPageLoading = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void fetchProfileData() async {
    String token = context.read<UserCubit>().state.user.token;
    ContractorProfileModel? model =
        await context.read<UserCubit>().getContractorData(token, 'contractor');
    print("modl $model");
    if (model != null) {
      print("From if");
      _firstNameController.text = model.firstName;
      _lastNameController.text = model.lastName;
      _emailControlller.text = model.email;
      _phoneNumberController.text = model.phoneNumber;
      _otherNumberController.text = model.otherNumber ?? '';
      _businessNameController.text = model.bussinessName;
      _abnController.text = model.abn;
      _addressLine1Controller.text = model.addressLine1;
      _addressLine2Controller.text = model.addressLine2;
      _cityController.text = model.city;
      _stateController.text = model.state;
      _postalCodeController.text = model.postalCode;
      image = model.profileImage;
    }
    setState(() {
      isPageLoading = false;
      avatarName =
          '${model?.firstName[0].toUpperCase()}${model?.lastName != null ? model?.lastName[0].toUpperCase() : ""}';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future pickImage() async {
    try {
      final getImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (getImage == null) return;

      imagePath = getImage.path;

      final imageTemporary = File(getImage.path);
      setState(() {
        fileImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  void _onSubmit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      if (_firstNameController.text != '' ||
          _lastNameController.text != '' ||
          _emailControlller.text != '' ||
          _phoneNumberController.text != '') {
        setState(() {
          isLoading = true;
        });

        String token = context.read<UserCubit>().state.user.token;

        ContractorProfileModel model = ContractorProfileModel(
          id: 0,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailControlller.text,
          phoneNumber: _phoneNumberController.text,
          otherNumber: _otherNumberController.text,
          abn: _abnController.text,
          addressLine1: _addressLine1Controller.text,
          addressLine2: _addressLine2Controller.text,
          city: _cityController.text,
          state: _stateController.text,
          bussinessName: _businessNameController.text,
          fullName: '${_firstNameController.text} ${_lastNameController.text}',
          postalCode: _postalCodeController.text,
          profileImage: imagePath,
          status: '',
          type: 'contractor',
        );

        String res = await context
            .read<UserCubit>()
            .updateContractorProfile(token, model);

        setState(() {
          isLoading = false;
        });

        if (res == "error") {
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
          const snackBar = SnackBar(
            content: Text('Profile Updated Successfully'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        form.save();
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: isPageLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: fileImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      fileImage!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : (image == null || image == ''
                                    ? Text(avatarName)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          image!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  SvgPicture.asset('assets/icons/camera.svg'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputArea(
                      name: "First Name", controller: _firstNameController),
                  buildInputArea(
                      name: "Last Name", controller: _lastNameController),
                  buildInputArea(
                      name: "Email Address", controller: _emailControlller),
                  buildInputArea(
                      name: "Phone Number", controller: _phoneNumberController),
                  buildInputArea(
                      name: "Other Number",
                      controller: _otherNumberController,
                      required: false),
                  buildInputArea(
                      name: "Business Name",
                      controller: _businessNameController),
                  buildInputArea(name: "ABN", controller: _abnController),
                  buildInputArea(
                      name: "Address (Line 1)",
                      controller: _addressLine1Controller),
                  buildInputArea(
                      name: "Address (Line 2)",
                      controller: _addressLine2Controller,
                      required: false),
                  buildInputArea(name: "City", controller: _cityController),
                  buildInputArea(name: "State", controller: _stateController),
                  buildInputArea(
                      name: "Postal Code", controller: _postalCodeController),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Update Profile"),
                        onPressed: () => _onSubmit()),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildInputArea(
      {required String name,
      required TextEditingController controller,
      bool required = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        MyTextField(
          required: required,
          hintText: '',
          controller: controller,
          onChange: (value) {},
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
