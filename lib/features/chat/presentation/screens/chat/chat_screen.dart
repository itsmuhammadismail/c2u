import 'package:c2u/features/chat/presentation/cubits/chat/chat_cubit.dart';
import 'package:c2u/features/chat/presentation/screens/chat/widgets/app_bar.dart';
import 'package:c2u/features/chat/presentation/screens/chat/widgets/bottom_bar.dart';
import 'package:c2u/features/chat/presentation/screens/chat/widgets/message.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/route_aware/route_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

bool isRoute = true;

class ChatScreen extends StatefulWidget {
  final int assignId;
  final String title;

  static String id = "chat_screen";

  const ChatScreen({super.key, required this.assignId, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends RouteAwareState<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> fetchAllMessages() async {
    String? token =
        _scaffoldKey.currentContext?.read<UserCubit>().state.user.token;
    if (token != null) {
      await _scaffoldKey.currentContext
          ?.read<ChatCubit>()
          .getMessages(token, widget.assignId);
    }
  }

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void start() async {
    while (isRoute) {
      await fetchAllMessages();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void didPush() {
    isRoute = true;
    start();
  }

  @override
  void didPopNext() {
    isRoute = true;
    start();
  }

  @override
  void didPushNext() {
    isRoute = false;
  }

  @override
  void dispose() {
    isRoute = false;
    _scaffoldKey.currentContext?.read<ChatCubit>().setToInitial();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String type = context.read<UserCubit>().state.user.type;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFE1D9BA),
      appBar: ChatAppBar(
        title: widget.title,
      ),
      body: Body(controller: _controller),
      bottomNavigationBar:
          BottomBar(assignId: widget.assignId, scrollDown: _scrollDown),
    );
  }
}
