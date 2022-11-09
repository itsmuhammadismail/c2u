import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isMe;
  final String text;

  const Message({super.key, this.isMe = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isMe ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(13),
              bottomRight: const Radius.circular(13),
              topRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(13),
              topLeft:
                  isMe ? const Radius.circular(13) : const Radius.circular(0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.white : kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
