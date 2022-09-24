part of '../login_screen.dart';

class Body extends StatefulWidget {
  final String loginAs;

  const Body({super.key, required this.loginAs});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _forgetEmailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgetFormKey = GlobalKey<FormState>();

  void _onSuccess() => Navigate.to(context, DashbaordScreen.id);

  void _onSubmit(VoidCallback onSuccess) async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_emailController.text != '') {
        await context.read<UserCubit>().login(
              _emailController.text,
              _passwordController.text,
              widget.loginAs.toLowerCase(),
            );
        if (context.read<UserCubit>().state.status == UserStatus.error) {
          _emailController.clear();
          _passwordController.clear();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Login Failed!',
                body: 'Email or Password is incorrect',
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

  void _onForgetSubmit() async {
    final form = _forgetFormKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      Navigator.pop(context);
      String message = await context.read<UserCubit>().forgetPassword(
            _forgetEmailController.text,
          );
      print(message);
      // if (context.read<UserCubit>().state.status == UserStatus.error) {
      //   _forgetEmailController.clear();
      // } else {
      //   // onSuccess.call();
      //   print("Successfully");
      // }
      final snackBar = SnackBar(
        content: Text(message != '' ? message : 'Error in sending email'),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      form.save();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SizedBox(
          height: size.height * 0.65,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Login as a ${widget.loginAs}",
                  style: kBlueHeading.copyWith(
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 40),
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
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    onChange: (value) {},
                  ),
                ),
                TextFieldContainer(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        forgetBottomSheet(context);
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: Button(
                    child: context.watch<UserCubit>().state.status ==
                            UserStatus.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Login'),
                    onPressed: () => _onSubmit(_onSuccess),
                  ),
                ),
                const SizedBox(height: 30),
                // TextFieldContainer(
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Color(0xFFFFE0B0),
                //             borderRadius: BorderRadius.circular(6),
                //           ),
                //           height: 50,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               SvgPicture.asset('assets/icons/google.svg'),
                //               SizedBox(width: 10),
                //               const Text('Google'),
                //             ],
                //           ),
                //         ),
                //       ),
                //       const SizedBox(width: 20),
                //       Expanded(
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Color(0xFFD1DBFF),
                //             borderRadius: BorderRadius.circular(6),
                //           ),
                //           height: 50,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               SvgPicture.asset('assets/icons/facebook.svg'),
                //               SizedBox(width: 10),
                //               const Text('Facebook'),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Spacer(),
                widget.loginAs != 'Contractor'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Dont have account?"),
                          const SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> forgetBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: Colors.white,
      builder: ((context) => SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: [
                  Container(
                    height: 400,
                    child: Center(
                      child: Form(
                        key: _forgetFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 40),
                            Text("Forgot Password", style: kHeading1),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 300,
                              child: Text(
                                  "Enter your email for the verification. We will send you 4 digital code to your email."),
                            ),
                            SizedBox(height: 40),
                            Text("Enter Email Address"),
                            SizedBox(height: 10),
                            TextFieldContainer(
                              child: MyTextField(
                                hintText: "loremipsum@gmail.com",
                                autofocus: true,
                                onChange: (value) {},
                              ),
                            ),
                            SizedBox(height: 30),
                            Button(
                                child: const Text("Continue"),
                                onPressed: () => _onForgetSubmit()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
