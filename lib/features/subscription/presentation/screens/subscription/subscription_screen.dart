import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartx/dartx.dart';

part 'widgets/body.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  static String id = "subscription_screen";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Subscription',
      body: Body(),
    );
  }
}
