import 'dart:io';

import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/date_selector.dart';
import 'package:c2u/shared/widgets/text_area.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:c2u/shared/widgets/text_field_container.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

part 'widgets/body.dart';

class SubbieProfileScreen extends StatefulWidget {
  const SubbieProfileScreen({Key? key}) : super(key: key);

  static String id = "subbie_profile_screen";

  @override
  State<SubbieProfileScreen> createState() => _SubbieProfileScreenState();
}

class _SubbieProfileScreenState extends State<SubbieProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Profile",
      body: Body(),
    );
  }
}
