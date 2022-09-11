part of '../splash_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Center(
          child: Image.asset('assets/logos/c2u.png'),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'assets/images/splash_circles.png',
            width: size.width,
          ),
        ),
      ],
    );
  }
}
