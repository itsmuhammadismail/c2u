import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
