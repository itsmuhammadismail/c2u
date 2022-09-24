import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetDashboardUseCase extends UseCase<Dashboard, TokenParams> {
  final JobRepositoryImpl repository;

  GetDashboardUseCase({required this.repository});

  @override
  Future<Either<Failure, Dashboard>> call(TokenParams params) {
    return repository.dashboard(
      token: params.token,
    );
  }
}
