import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  static String id = "change_password_screen";

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: "Change Password",
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
