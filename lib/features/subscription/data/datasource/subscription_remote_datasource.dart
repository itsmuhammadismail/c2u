import 'package:c2u/features/subscription/data/model/subscription_model.dart';
import 'package:c2u/shared/network/network.dart';

class SubscriptionRemoteDatasource {
  Future<List<SubscriptionModel>> allSubscriptions(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'package?orderby=sort&orderdir=ASC&status=active',
        token: token,
      );

      print(res['data']);

      List<SubscriptionModel> subscriptions = res['data']['data']
          .map<SubscriptionModel>((data) => SubscriptionModel.fromJson(data))
          .toList();

      return subscriptions;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> currentSubscription(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'subscription/current_subscription',
        token: token,
      );

      // SubscriptionModel subscription = SubscriptionModel.fromJson(res['data']['name']);
      return res['data']['name'];
    } catch (e) {
      rethrow;
    }
  }
}
