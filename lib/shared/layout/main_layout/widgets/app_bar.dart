import 'package:c2u/features/chat/presentation/screens/notification/notification_screen.dart';
import 'package:c2u/shared/routes/navigate.dart';
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
      actions: [
        IconButton(
            onPressed: () => Navigate.to(context, NotificationScreen.id),
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
              size: 30,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
