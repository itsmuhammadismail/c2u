import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/shared/network/network.dart';

class JobRemoteDataSource {
  Future<DashboardModel> dashboard(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'contractor_dashboard',
        token: token,
      );

      DashboardModel user = DashboardModel.fromJson(res);
      print(user);
      return user;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
