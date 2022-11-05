import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/create_job_params.dart';
import 'package:dartz/dartz.dart';

abstract class JobRepository {
  Future<Either<Failure, Dashboard>> dashboard({
    required String token,
  });
  Future<Either<Failure, SubbiesDashboard>> subbieDashboard({
    required String token,
  });
  Future<Either<Failure, List<Job>>> getSubbieJobs({
    required String token,
    required String id,
    required String role,
  });
  Future<Either<Failure, bool>> createJob({
    required CreateJobParams params,
  });
}
