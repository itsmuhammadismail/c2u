import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> allNotification({
    required String token,
    required String id,
  });
}
