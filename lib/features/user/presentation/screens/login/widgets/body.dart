part of '../login_screen.dart';

class Body extends StatefulWidget {
  final String loginAs;

  const Body({super.key, required this.loginAs});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height * 0.65,
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
                onChange: () {},
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
              child: MyTextField(
                hintText: 'Password',
                onChange: () {},
              ),
            ),
            TextFieldContainer(
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((context) => Center(
                              child: Button(
                                  child: const Text("hello"), onPressed: () {}),
                            )));
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
                child: const Text('Login'),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 30),
            TextFieldContainer(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE0B0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/google.svg'),
                          SizedBox(width: 10),
                          const Text('Google'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD1DBFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/facebook.svg'),
                          SizedBox(width: 10),
                          const Text('Facebook'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
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
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
