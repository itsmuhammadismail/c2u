import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:dartx/dartx.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notification.name),
      subtitle: Text(notification.body),
      leading: CircleAvatar(backgroundImage: NetworkImage(notification.image)),
      trailing:
          Text(timeago.format(DateTime.parse(notification.date)).capitalize()),
    );
  }
}
