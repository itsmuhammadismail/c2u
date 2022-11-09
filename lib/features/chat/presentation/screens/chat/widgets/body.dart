// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../chat_screen.dart';

class Body extends StatefulWidget {
  ScrollController controller;
  Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return context.watch<ChatCubit>().state.status == ChatStatus.initial ||
            context.watch<ChatCubit>().state.status == ChatStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ListView.builder(
                controller: widget.controller,
                reverse: true,
                itemCount: context.watch<ChatCubit>().state.chats.length,
                itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        Column(
                          children: [
                            Message(
                              isMe: context
                                      .watch<ChatCubit>()
                                      .state
                                      .chats[index]
                                      .userId ==
                                  context.read<UserCubit>().state.user.id,
                              text: context
                                  .watch<ChatCubit>()
                                  .state
                                  .chats[index]
                                  .message,
                            ),
                          ],
                        ),
                      ],
                    )),
          );
  }
}
