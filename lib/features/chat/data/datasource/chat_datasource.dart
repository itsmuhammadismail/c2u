import 'package:c2u/shared/network/network.dart';

class ChatDataSource {
  Future<bool> sendMessage(
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

      // DashboardModel user = DashboardModel.fromJson(res);

      return true;
    } catch (e) {
      rethrow;
    }
  }

    Future<bool> allMessage(
    String token,
    String jobId,
  ) async {


    try {
      var res = await NetworkHelper.get(
        url: 'message/$jobId?page=1',
        token: token,
      );

      // DashboardModel user = DashboardModel.fromJson(res);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
