import 'package:c2u/features/chat/data/model/notification_model.dart';
import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class NotificationMapper extends Mapper<NotificationEntity, NodtificationModel> {
  @override
  NotificationEntity mapModeltoEntity(NodtificationModel model) {
    NotificationEntity notification = NotificationEntity(
      id: model.id,
      userId: model.userId,
      name: model.name,
      image: model.image,
      body: model.body,
      date: model.date,
    );
    return notification;
  }
}
