import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/features/chat/domain/repository/chat_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/message_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMessagesUseCase extends UseCase<List<Chat>, MessageParams> {
  final ChatRepositoryImpl repository;

  GetMessagesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Chat>>> call(MessageParams params) {
    return repository.allMessages(
      token: params.token,
      jobId: params.jobId,
    );
  }
}
