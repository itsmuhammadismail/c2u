import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool back;

  const MainAppBar({super.key, required this.title, required this.back});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () =>
            back ? Navigator.pop(context) : Scaffold.of(context).openDrawer(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: back
              ? const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )
              : SvgPicture.asset('assets/icons/menu.svg'),
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
