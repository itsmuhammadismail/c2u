import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/screens/job_list/widgets/job_card.dart';
import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/params/create_job_params.dart';
import 'package:c2u/shared/widgets/alert.dart';
import 'package:c2u/shared/widgets/button.dart';
import 'package:c2u/shared/widgets/date_selector.dart';
import 'package:c2u/shared/widgets/dropdown.dart';
import 'package:c2u/shared/widgets/text_area.dart';
import 'package:c2u/shared/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'widgets/body.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  static String id = 'add_job_screen';

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Add Job',
      body: Body(),
      back: true,
    );
  }
}
