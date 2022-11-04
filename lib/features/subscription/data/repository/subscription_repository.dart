import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, List<Subscription>>> allSubscriptions({
    required String token,
  });

  Future<Either<Failure, String>> currentSubscription({
    required String token,
  });

  Future<Either<Failure, String>> upgradeSubscription({
    required String token,
    required String paymentMethod,
    required String plan,
  });
}
