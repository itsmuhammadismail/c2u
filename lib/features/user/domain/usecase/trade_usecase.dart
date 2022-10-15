import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class TradeUseCase extends UseCase<List<Trade>, TokenParams> {
  final UserRepositoryImpl repository;

  TradeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Trade>>> call(TokenParams params) {
    return repository.getTrades(
      token: params.token,
    );
  }
}
