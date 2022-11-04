import 'package:c2u/features/subscription/domain/repository/subscription_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/subscription_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UpgradeSubscriptionUseCase extends UseCase<String, SubscriptionParams> {
  final SubscriptionRepositoryImpl repository;

  UpgradeSubscriptionUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SubscriptionParams params) {
    return repository.upgradeSubscription(
      token: params.token,
      paymentMethod: params.paymentMethod,
      plan: params.plan,
    );
  }
}
