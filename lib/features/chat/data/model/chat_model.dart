import 'package:c2u/features/chat/domain/entity/chat_entity.dart';

class ChatModel extends Chat {
  const ChatModel({
    required int id,
    required String message,
    required int userId,
  }) : super(
          id: id,
          message: message,
          userId: userId,
        );

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['message_id'],
      message: json['message'],
      userId: json['user']['user_id'],
    );
  }
}
