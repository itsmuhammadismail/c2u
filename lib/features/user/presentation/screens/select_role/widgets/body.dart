part of "../select_role_screen.dart";

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.65,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text("Welcome To C2U", style: kBlueHeading),
            const SizedBox(height: 10),
            const Text("Please Select the appropriate option below"),
            const SizedBox(height: 60),
            const LoginCard(
              icon: 'assets/icons/constructor.svg',
              text: 'Login as a Contarctor',
              navigate: LoginScreen(
                loginAs: 'Contractor',
              ),
            ),
            const SizedBox(height: 40),
            const LoginCard(
                icon: 'assets/icons/subbies.svg',
                text: 'Login as a Subbies',
                navigate: LoginScreen(
                  loginAs: 'Subbies',
                )),
            const SizedBox(height: 10),
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
