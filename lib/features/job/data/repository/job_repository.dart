import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class JobRepository {
  Future<Either<Failure, Dashboard>> dashboard({
    required String token,
  });
}
