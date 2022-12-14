import 'package:c2u/features/chat/presentation/screens/chat/chat_screen.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:c2u/features/chat/presentation/screens/chat/chat_screen.dart';

class JobAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Job job;
  final bool back;

  const JobAppBar(
      {super.key, required this.title, required this.job, required this.back});

  @override
  Widget build(BuildContext context) {
    String type = context.read<UserCubit>().state.user.type;

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                      assignId: job.assignId,
                      title:
                          type == 'contractor' ? job.subbie : job.contractor)),
            ),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Chat'),
                  SizedBox(width: 5),
                  Icon(Icons.chat, color: Colors.white),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
