import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/auth_layout/auth_layout.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:c2u/shared/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  final String loginAs;

  static String id = "login_screen";

  const LoginScreen({super.key, required this.loginAs});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      body: Body(loginAs: loginAs),
    );
  }
}
