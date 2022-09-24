import 'package:c2u/features/subscription/data/model/subscription_model.dart';
import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class SubscriptionMapper extends Mapper<Subscription, SubscriptionModel> {
  @override
  Subscription mapModeltoEntity(SubscriptionModel model) {
    Subscription subscription = Subscription(
      name: model.name,
      duration: model.duration,
      endsAt: model.endsAt,
      isActive: model.isActive,
      status: model.status,
    );
    return subscription;
  }
}
