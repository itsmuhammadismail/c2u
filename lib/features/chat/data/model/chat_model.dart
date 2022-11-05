import 'package:c2u/features/chat/domain/entity/chat_entity.dart';

class ChatModel extends Chat {
  const ChatModel({
    required int id,
    required String message,
    required bool isMe,
  }) : super(
          id: id,
          message: message,
          isMe: isMe,
        );

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['data']['id'],
      message: json['data']['message'],
      isMe: json['data']['me'],
    );
  }
}
