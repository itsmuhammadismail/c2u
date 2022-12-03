import 'dart:io';

import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/profile/widgets/contractor_profile_model.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/date_selector.dart';
import 'package:c2u/shared/widgets/dropdown.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String id = "profile_screen";

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: "Profile",
      body: Body(),
    );
  }
}
