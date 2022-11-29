import 'package:c2u/features/chat/data/model/notification_model.dart';
import 'package:c2u/shared/network/network.dart';

class NotificationDataSource {
  Future<List<NodtificationModel>> allNotifications(
    String token,
    String id,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url:
            'chat_notification/$id?orderby=id&orderdir=DESC&perpage=100&page=1&counts',
        token: token,
      );

      List<NodtificationModel> chatModels = res['data']['data']
          .map<NodtificationModel>((data) => NodtificationModel.fromJson(data))
          .toList();

      return chatModels;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
