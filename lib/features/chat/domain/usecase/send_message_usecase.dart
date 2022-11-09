import 'package:c2u/features/chat/domain/repository/chat_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/message_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SendMessageUseCase extends UseCase<String, MessageParams> {
  final ChatRepositoryImpl repository;

  SendMessageUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(MessageParams params) {
    return repository.sendMessage(
      token: params.token,
      jobId: params.jobId,
      message: params.message,
    );
  }
}
