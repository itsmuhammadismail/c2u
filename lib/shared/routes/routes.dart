import 'package:c2u/features/user/presentation/screens/select_role/select_role_screen.dart';
import 'package:c2u/features/user/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    SelectRoleScreen.id: (context) => const SelectRoleScreen(),
  };
}
