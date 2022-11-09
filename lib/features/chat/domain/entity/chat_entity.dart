import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final int id, userId;
  final String message;

  const Chat({
    required this.id,
    required this.message,
    required this.userId,
  });

  factory Chat.initial() => const Chat(id: 0, message: '', userId: 0);

  @override
  List<Object?> get props => [id, message, userId];
}
