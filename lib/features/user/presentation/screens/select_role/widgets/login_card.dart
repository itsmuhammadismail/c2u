import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginCard extends StatelessWidget {
  final String icon, text;
  final navigate;

  const LoginCard({
    super.key,
    required this.icon,
    required this.text,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigate),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            width: 2,
            color: const Color(0xFFFECD07),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 40,
            ),
            const SizedBox(width: 20),
            Text(text),
          ],
        ),
      ),
    );
  }
}
