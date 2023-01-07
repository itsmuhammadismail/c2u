import 'dart:async';

import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/select_role/select_role_screen.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './widgets/body.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  static String id = "delete_account";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Delete Account',
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
