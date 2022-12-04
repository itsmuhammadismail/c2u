import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SubbieUseCase extends UseCase<List<Subbie>, TokenParams> {
  final UserRepositoryImpl repository;

  SubbieUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Subbie>>> call(TokenParams params) {
    return repository.getSubbies(
      token: params.token,
      url: params.url,
    );
  }
}
