import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, bool>> sendMessage({
    required String token,
    required String jobId,
    required String message,
  });
}
