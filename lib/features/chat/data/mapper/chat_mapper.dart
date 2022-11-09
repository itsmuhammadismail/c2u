import 'package:c2u/features/chat/data/model/chat_model.dart';
import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class ChatMapper extends Mapper<Chat, ChatModel> {
  @override
  Chat mapModeltoEntity(ChatModel model) {
    Chat chat = Chat(
      id: model.id,
      message: model.message,
      userId: model.userId,
    );
    return chat;
  }
}
