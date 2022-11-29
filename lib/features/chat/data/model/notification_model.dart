import 'package:c2u/features/chat/domain/entity/notification_entity.dart';

class NodtificationModel extends NotificationEntity {
  const NodtificationModel({
    required int id,
    required int userId,
    required String name,
    required String image,
    required String body,
    required String date,
  }) : super(
          id: id,
          userId: userId,
          name: name,
          image: image,
          body: body,
          date: date,
        );

  factory NodtificationModel.fromJson(Map<String, dynamic> json) {
    print("from jsno");
    print(json);
    return NodtificationModel(
      id: json['notification_id'],
      userId: json['assign_id'],
      name: json['from_user']['first_name'],
      image: json['from_user']['profile_image'],
      body: json['body'],
      date: json['created_at'],
    );
  }
}
