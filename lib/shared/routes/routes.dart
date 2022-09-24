import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/job/presentation/screens/job_details/job_details_Screen.dart';
import 'package:c2u/features/job/presentation/screens/job_list/job_list_screen.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/billing_subscription_screen.dart';
import 'package:c2u/features/user/presentation/screens/account_setting/accout_setting.dart';
import 'package:c2u/features/user/presentation/screens/change_password/change_password_screen.dart';
import 'package:c2u/features/user/presentation/screens/profile/profile_screen.dart';
import 'package:c2u/features/user/presentation/screens/select_role/select_role_screen.dart';
import 'package:c2u/features/user/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    SelectRoleScreen.id: (context) => const SelectRoleScreen(),
    DashbaordScreen.id: (context) => const DashbaordScreen(),
    ProfileScreen.id: (context) => const ProfileScreen(),
    ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
    AccountSettingScreen.id: (context) => const AccountSettingScreen(),
    BillingSubscriptionScreen.id: (context) => const BillingSubscriptionScreen(),
    JobListScreen.id: (context) => const JobListScreen(),
    JobDetailsCreen.id: (context) => const JobDetailsCreen(),
  };
}
