import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/domain/repository/subscription_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class AllSubscriptionUseCase extends UseCase<List<Subscription>, TokenParams> {
  final SubscriptionRepositoryImpl repository;

  AllSubscriptionUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Subscription>>> call(TokenParams params) {
    return repository.allSubscriptions(
      token: params.token,
    );
  }
}
