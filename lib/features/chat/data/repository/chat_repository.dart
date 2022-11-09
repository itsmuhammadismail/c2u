import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, String>> sendMessage({
    required String token,
    required String jobId,
    required String message,
  });

  Future<Either<Failure, List<Chat>>> allMessages({
    required String token,
    required String jobId,
  });
}
