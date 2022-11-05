import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final int id;
  final String message;
  final bool isMe;

  const Chat({
    required this.id,
    required this.message,
    required this.isMe,
  });

  factory Chat.initial() => const Chat(id: 0, message: '', isMe: false);

  @override
  List<Object?> get props => [id, message, isMe];
}
