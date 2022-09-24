import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/widgets/subscription_card.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class BillingSubscriptionScreen extends StatefulWidget {
  const BillingSubscriptionScreen({Key? key}) : super(key: key);

  static String id = "billing_subscription_screen";

  @override
  State<BillingSubscriptionScreen> createState() =>
      _BillingSubscriptionScreenState();
}

class _BillingSubscriptionScreenState extends State<BillingSubscriptionScreen> {
  Future<void> fetchAllSubscriptions(String token) async {
    await context.read<SubscriptionCubit>().allSubscriptions(token);
  }

  Future<void> fetchCurrentSubscriptions(String token) async {
    await context.read<SubscriptionCubit>().currentSubscriptions(token);
  }

  void fetch(String token) async {
    await fetchAllSubscriptions(token);
    await fetchCurrentSubscriptions(token);
  }

  @override
  void initState() {
    super.initState();
    if (context.read<SubscriptionCubit>().state.status ==
        SubscriptionStatus.initial) {
      String token = context.read<UserCubit>().state.user.token;
      fetch(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Plans',
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
