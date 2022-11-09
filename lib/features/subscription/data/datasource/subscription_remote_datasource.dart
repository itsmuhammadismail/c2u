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
      print(e.toString());
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
      print(res);
      return res['data'] != null ? res['data']['name'] : '';
    } catch (e) {
      rethrow;
    }
  }

  Future<String> upgradeSubscription(
    String token,
    String paymentMethod,
    String plan,
  ) async {
    Map<String, String> data = {
      "payment_method": paymentMethod,
      "plan": plan,
    };

    try {
      var res = await NetworkHelper.post(
        url: 'subscription/upgrade',
        token: token,
        data: data,
      );

      // SubscriptionModel subscription = SubscriptionModel.fromJson(res['data']['name']);
      print(res);
      return 'Successfully upgraded';
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
