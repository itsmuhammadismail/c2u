import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id, userId;
  final String name, image, body, date;

  const NotificationEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.image,
    required this.body,
    required this.date,
  });

  factory NotificationEntity.initial() => const NotificationEntity(
        id: 0,
        userId: 0,
        name: '',
        image: '',
        body: '',
        date: '',
      );

  @override
  List<Object?> get props => [id, userId, name, image, body, date];
}
