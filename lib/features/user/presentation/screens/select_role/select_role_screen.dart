import 'package:c2u/features/user/presentation/screens/login/login_screen.dart';
import 'package:c2u/features/user/presentation/screens/select_role/widgets/login_card.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/auth_layout/auth_layout.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  static String id = "select_role_screen";

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(isWhite: true, body: Body());
  }
}
