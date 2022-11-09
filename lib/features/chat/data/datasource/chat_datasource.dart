import 'package:c2u/features/chat/data/model/chat_model.dart';
import 'package:c2u/shared/network/network.dart';

class ChatDataSource {
  Future<String> sendMessage(
    String token,
    String jobId,
    String message,
  ) async {
    Map<String, String> data = {
      "message": message,
    };

    try {
      var res = await NetworkHelper.post(
        url: 'message/$jobId/create',
        token: token,
        data: data,
      );

      return res['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatModel>> allMessage(
    String token,
    String jobId,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'message/$jobId?page=1',
        token: token,
      );

      List<ChatModel> chatModels = res['data']['data']
          .map<ChatModel>((data) => ChatModel.fromJson(data))
          .toList();

      return chatModels;
    } catch (e) {
      rethrow;
    }
  }
}
