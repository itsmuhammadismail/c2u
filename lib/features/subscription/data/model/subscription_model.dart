import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';

class SubscriptionModel extends Subscription {
  SubscriptionModel({
    required String name,
    required String duration,
    required String status,
    required String endsAt,
    required bool isActive,
  }) : super(
          name: name,
          duration: duration,
          status: status,
          endsAt: endsAt,
          isActive: isActive,
        );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      name: json['name'],
      duration: json['duration'],
      status: json['status'],
      endsAt: json['trial_ends_at'],
      isActive: true,
    );
  }
}
