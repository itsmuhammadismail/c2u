import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final bool isWhite;

  const AuthLayout({super.key, this.isWhite = false, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isWhite ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/auth_circles.png'),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Image.asset('assets/logos/c2u.png'),
                    ),
                  ),
                ],
              ),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
