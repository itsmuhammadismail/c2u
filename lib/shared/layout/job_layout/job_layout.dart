import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/shared/layout/job_layout/widgets/app_bar.dart';
import 'package:c2u/shared/layout/main_layout/widgets/drawer.dart';
import 'package:flutter/material.dart';

class JobLayout extends StatelessWidget {
  final String title;
  final Job job;
  final bool back;
  final Widget body;

  const JobLayout(
      {super.key, required this.title, required this.job, required this.body, this.back = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobAppBar(title: title, job: job, back: back),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(child: body),
    );
  }
}
