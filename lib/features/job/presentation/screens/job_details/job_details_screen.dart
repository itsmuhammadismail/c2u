import 'dart:io';

import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/job_layout/job_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dartx/dartx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:open_filex/open_filex.dart';

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
    return JobLayout(
      title: 'Job Detail',
      back: true,
      job: widget.job,
      body: SingleChildScrollView(
        child: Body(job: widget.job),
      ),
    );
  }
}
