part of '../accout_setting.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailControlller = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String avatarName = '';

  bool isPageLoading = true;

  String? image;
  File? fileImage;
  String? imagePath = null;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void fetchProfileData() async {
    String token = context.read<UserCubit>().state.user.token;
    String type = context.read<UserCubit>().state.user.type;

    ContractorProfileModel? model =
        await context.read<UserCubit>().getContractorData(token, type);
    print("modl $model");
    if (model != null) {
      print("From if");
      _firstNameController.text = model.firstName;
      _lastNameController.text = model.lastName;
      _emailControlller.text = model.email;
      _phoneNumberController.text = model.phoneNumber;

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

        String res = await context.read<UserCubit>().accountSettings(
            token,
            imagePath,
            _firstNameController.text,
            _lastNameController.text,
            "contractor",
            _emailControlller.text,
            _phoneNumberController.text);

        setState(() {
          isLoading = false;
        });

        if (res == "error") {
          // _firstNameController.clear();
          // _lastNameController.clear();
          // _emailControlller.clear();
          // _phoneNumberController.clear();

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
            content: Text('Account Updated Successfully'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        form.save();
      }
    } else {}
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
                    name: "First Name",
                    value: "",
                    controller: _firstNameController,
                  ),
                  buildInputArea(
                    name: "Last Name",
                    value: "",
                    controller: _lastNameController,
                  ),
                  buildInputArea(
                    name: "Email Address",
                    value: "",
                    controller: _emailControlller,
                  ),
                  buildInputArea(
                    name: "Phone Number",
                    value: "",
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Update Account"),
                        onPressed: () => _onSubmit()),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: OutlinedButton(
                        child: const Text("Delete Account"),
                        onPressed: () =>
                            Navigate.to(context, DeleteAccount.id)),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildInputArea({
    required String name,
    required String value,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        MyTextField(
          hintText: value,
          controller: controller,
          keyboardType: keyboardType,
          onChange: (value) {},
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
