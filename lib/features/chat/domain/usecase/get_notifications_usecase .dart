import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/features/chat/domain/repository/notification_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/message_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetNotificationsUseCase
    extends UseCase<List<NotificationEntity>, MessageParams> {
  final NotificationRepositoryImpl repository;

  GetNotificationsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(MessageParams params) {
    return repository.allNotification(
      token: params.token,
      id: params.jobId,
    );
  }
}
