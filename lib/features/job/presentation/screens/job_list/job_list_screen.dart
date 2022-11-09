import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/screens/add_job/add_job_screen.dart';
import 'package:c2u/features/job/presentation/screens/job_list/widgets/job_card.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({Key? key}) : super(key: key);

  static String id = 'job_list_screen';

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Job List',
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
