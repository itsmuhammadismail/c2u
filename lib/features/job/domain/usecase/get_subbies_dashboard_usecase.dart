import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSubbiesDashboardUseCase
    extends UseCase<SubbiesDashboard, TokenParams> {
  final JobRepositoryImpl repository;

  GetSubbiesDashboardUseCase({required this.repository});

  @override
  Future<Either<Failure, SubbiesDashboard>> call(TokenParams params) {
    return repository.subbieDashboard(
      token: params.token,
    );
  }
}
