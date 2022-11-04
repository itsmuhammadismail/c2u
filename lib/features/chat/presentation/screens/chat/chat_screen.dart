import 'package:c2u/features/chat/presentation/screens/chat/widgets/app_bar.dart';
import 'package:c2u/features/chat/presentation/screens/chat/widgets/bottom_bar.dart';
import 'package:c2u/features/chat/presentation/screens/chat/widgets/message.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static String id = "chat_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFE1D9BA),
      appBar: ChatAppBar(
        title: 'Technical Issue',
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
