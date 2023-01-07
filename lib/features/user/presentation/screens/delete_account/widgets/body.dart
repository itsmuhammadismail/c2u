part of '../delete_account_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _onSubmit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      if (_passwordController.text != '') {
        setState(() {
          isLoading = true;
        });

        String token = context.read<UserCubit>().state.user.token;

        String res = await context.read<UserCubit>().deleteAccount(
              token,
              _passwordController.text,
            );

        setState(() {
          isLoading = false;
        });

        if (res == "") {
          _passwordController.clear();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Failed!',
                body: 'Password is incorrect',
              );
            },
          );
        } else {
          var snackBar = SnackBar(
            content: Text(res),
          );

          Navigate.next(context, SelectRoleScreen.id);
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
              name: "Password",
              value: "",
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Button(
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Delete Account"),
                  onPressed: () => _onSubmit()),
            ),
          ],
        ),
      ),
    );
    ;
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
