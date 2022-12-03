import 'package:c2u/features/subscription/domain/repository/subscription_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/subscription_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class CancelParams {
  final String token, name;

  const CancelParams({
    required this.token,
    required this.name,
  });
}

class CancelSubscriptionUseCase extends UseCase<bool, CancelParams> {
  final SubscriptionRepositoryImpl repository;

  CancelSubscriptionUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(CancelParams params) {
    return repository.cancelSubscription(
      token: params.token,
      name: params.name,
    );
  }
}
