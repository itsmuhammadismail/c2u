import 'package:c2u/features/job/presentation/screens/job_list/widgets/job_card.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
