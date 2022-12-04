import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/billing_subscription_screen.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/select_role/select_role_screen.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    void _onSuccess() {
      if (context.read<UserCubit>().state.user.token == "") {
        Navigate.next(context, SelectRoleScreen.id);
      } else if (context.read<UserCubit>().state.user.status == 'pending') {
        Navigate.next(context, BillingSubscriptionScreen.id);
      } else {
        Navigate.next(context, DashbaordScreen.id);
      }
      // Navigate.next(context, SelectRoleScreen.id);
      // Navigate.next(context, DashbaordScreen.id);
    }

    void _navigateToNextScreen(VoidCallback onSuccess) async {
      await Future.delayed(const Duration(seconds: 1));
      onSuccess.call();
    }

    useEffect(() {
      _navigateToNextScreen(_onSuccess);
      return null;
    }, []);

    return const Scaffold(body: Body());
  }
}
