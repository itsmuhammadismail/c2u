import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class RegionUseCase extends UseCase<List<Region>, TokenParams> {
  final UserRepositoryImpl repository;

  RegionUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Region>>> call(TokenParams params) {
    return repository.getRegions(
      token: params.token,
    );
  }
}
