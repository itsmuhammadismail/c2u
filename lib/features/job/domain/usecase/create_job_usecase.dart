import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/create_job_params.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class CreateJobUseCase extends UseCase<bool, CreateJobParams> {
  final JobRepositoryImpl repository;

  CreateJobUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(CreateJobParams params) {
    return repository.createJob(
      params: params
    );
  }
}
