import 'package:c2u/features/chat/presentation/cubits/chat/chat_cubit.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatefulWidget {
  final int assignId;
  final Function scrollDown;

  const BottomBar(
      {super.key, required this.assignId, required this.scrollDown});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _messageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String token = context.read<UserCubit>().state.user.token;
    int userId = context.read<UserCubit>().state.user.id;

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_messageController.text != '') {
          String message = _messageController.text;
          _messageController.clear();
          await context
              .read<ChatCubit>()
              .sendMessage(token, widget.assignId, message, userId);

          widget.scrollDown();
          form.save();
        }
      } else {}
    }

    OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: BottomAppBar(
        color: const Color(0xFFE1D9BA),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(11))),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onEditingComplete:
                          () {}, // this prevents keyboard from closing
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        _onSubmit();
                      },
                      decoration: InputDecoration(
                        hintText: 'Type Something...',
                        border: border,
                        enabledBorder: border,
                        disabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _onSubmit(),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(11))),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
