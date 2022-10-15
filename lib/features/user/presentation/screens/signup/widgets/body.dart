part of '../signup_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? image;
  File? fileImage;
  String? imagePath;

  bool terms = false;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        fileImage = imageTemporary;
        imagePath = image.path;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return kPrimaryColor;
  }

  void _onSuccess() => Navigate.to(context, SubbieProfileScreen.id);

  void _onSubmit(VoidCallback onSuccess) async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_emailController.text != '') {
        await context.read<UserCubit>().signup(
              SubbieSignup(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                phoneNumber: _phoneController.text,
                password: _passwordController.text,
                confirmPassword: _confirmPasswordController.text,
                profileImage: imagePath.toString(),
                userType: 'subbie',
                terms: terms ? '1' : '0',
              ),
            );
        if (context.read<UserCubit>().state.status == UserStatus.error) {
          // _emailController.clear();
          // _passwordController.clear();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Signup Failed!',
                body: 'Something went wrong',
              );
            },
          );
        } else {
          onSuccess.call();
        }
        form.save();
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "SignUp as a Subbie",
              style: kBlueHeading.copyWith(
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 40),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'First Name',
                controller: _firstNameController,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Last Name',
                controller: _lastNameController,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Email',
                controller: _emailController,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Phone',
                controller: _phoneController,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Password',
                controller: _passwordController,
                obscureText: true,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: true,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 150,
                  child: Button(
                    color: const Color(0xFF967904),
                    child: const Text('Choose File'),
                    onPressed: () => pickImage(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFieldContainer(
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: terms,
                    onChanged: (bool? value) {
                      setState(() {
                        terms = value!;
                      });
                    },
                  ),
                  const Text("I agree with terms and conditions"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextFieldContainer(
              child: Button(
                child: context.watch<UserCubit>().state.status ==
                        UserStatus.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Sign Up'),
                // onPressed: () => _onSubmit(_onSuccess),
                onPressed: () => _onSubmit(_onSuccess),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
