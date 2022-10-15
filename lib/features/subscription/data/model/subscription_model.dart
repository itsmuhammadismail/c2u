import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';

class SubscriptionModel extends Subscription {
  SubscriptionModel({
    required String name,
    required String duration,
    required String durationType,
    required String price,
    required String status,
    required String endsAt,
    required bool isActive,
  }) : super(
          name: name,
          duration: duration,
          durationType: durationType,
          price: price,
          status: status,
          endsAt: endsAt,
          isActive: isActive,
        );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      name: json['title'],
      duration: json['duration'],
      durationType: json['duration_type'],
      price: json['_price'],
      status: json['status'],
      endsAt: json['trial_ends_at'],
      isActive: true,
    );
  }
  
}
