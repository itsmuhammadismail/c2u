part of '../change_password_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _currentPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _onSubmit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_passwordController.text != _confirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Alert(
              heading: 'Failed!',
              body: 'Password & Confirm Password not matched',
            );
          },
        );
        return;
      }

      if (_currentPasswordController.text != '') {
        setState(() {
          isLoading = true;
        });

        String token = context.read<UserCubit>().state.user.token;

        String res = await context.read<UserCubit>().changePassword(
              token,
              _currentPasswordController.text,
              _passwordController.text,
              _confirmPasswordController.text,
            );

        setState(() {
          isLoading = false;
        });

        if (res == "error") {
          _currentPasswordController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();

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
          var snackBar = SnackBar(
            content: Text(res),
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildInputArea(
              name: "Current Password",
              value: "",
              controller: _currentPasswordController,
            ),
            buildInputArea(
              name: "Password",
              value: "",
              controller: _passwordController,
            ),
            buildInputArea(
              name: "Confirm Password",
              value: "",
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Button(
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Change Password"),
                  onPressed: () => _onSubmit()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputArea(
      {required String name,
      required String value,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        MyTextField(
          hintText: value,
          controller: controller,
          onChange: (value) {},
          obscureText: true,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
