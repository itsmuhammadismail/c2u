import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dartx/dartx.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'widgets/body.dart';

class JobDetailsCreen extends StatefulWidget {
  final Job job;
  const JobDetailsCreen({
    required this.job,
    Key? key,
  }) : super(key: key);

  // static String id = "job_details_screen";

  @override
  State<JobDetailsCreen> createState() => _JobDetailsCreenState();
}

class _JobDetailsCreenState extends State<JobDetailsCreen> {
  

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Job Detail',
      back: true,
      body: SingleChildScrollView(
        child: Body(job: widget.job),
      ),
    );
  }
}
