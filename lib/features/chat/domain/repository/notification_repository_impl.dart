import 'package:c2u/features/chat/data/datasource/chat_datasource.dart';
import 'package:c2u/features/chat/data/datasource/notification_datasource.dart';
import 'package:c2u/features/chat/data/mapper/chat_mapper.dart';
import 'package:c2u/features/chat/data/mapper/notification_mapper.dart';
import 'package:c2u/features/chat/data/model/chat_model.dart';
import 'package:c2u/features/chat/data/model/notification_model.dart';
import 'package:c2u/features/chat/data/repository/notification_repository.dart';
import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  late NotificationDataSource _remoteDataSource;
  late NotificationMapper _mapper;

  NotificationRepositoryImpl({
    required NotificationDataSource notificationDataSource,
    required NotificationMapper notificationMapper,
  }) {
    _remoteDataSource = notificationDataSource;
    _mapper = notificationMapper;
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> allNotification({
    required String token,
    required String id,
  }) async {
    try {
      List<NodtificationModel> notificationModel =
          await _remoteDataSource.allNotifications(token, id);

      List<NotificationEntity> result = notificationModel
          .map<NotificationEntity>((data) => _mapper.mapModeltoEntity(data))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
