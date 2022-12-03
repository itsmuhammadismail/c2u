import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';

class SubscriptionModel extends Subscription {
  SubscriptionModel({
    required String name,
    required String duration,
    required String durationType,
    required String price,
    required String status,
    required String? endsAt,
    required String? trialEndsAt,
    required String? startedDate,
    required String? nextBillingDate,
    required bool isActive,
    required String userType,
  }) : super(
          name: name,
          duration: duration,
          durationType: durationType,
          price: price,
          status: status,
          endsAt: endsAt,
          trialEndsAt: trialEndsAt,
          startedDate: startedDate,
          nextBillingDate: nextBillingDate,
          isActive: isActive,
          userType: userType,
        );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      name: json['title'],
      duration: json['duration'],
      durationType: json['duration_type'],
      price: json['price'].toString(),
      status: json['status'],
      endsAt: json['ends_at'],
      trialEndsAt: json['trial_ends_at'],
      startedDate: null,
      nextBillingDate: null,
      isActive: false,
      userType: json['user_type'],
    );
  }
}
