import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/features/chat/presentation/cubits/notification/notification_cubit.dart';
import 'package:c2u/features/chat/presentation/screens/chat/chat_screen.dart';
import 'package:c2u/features/chat/presentation/screens/notification/widgets/notification_card.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String id = "notification_screen";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Notifications',
      body: Body(),
    );
  }
}
