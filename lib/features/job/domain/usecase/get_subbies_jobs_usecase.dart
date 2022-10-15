import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_id_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSubbiesJobsUseCase extends UseCase<List<Job>, TokenIdParams> {
  final JobRepositoryImpl repository;

  GetSubbiesJobsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Job>>> call(TokenIdParams params) {
    return repository.getSubbieJobs(
      token: params.token,
      id: params.id,
      role: params.role,
    );
  }
}
