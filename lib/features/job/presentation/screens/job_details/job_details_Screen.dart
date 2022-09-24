import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'widgets/body.dart';

class JobDetailsCreen extends StatelessWidget {
  const JobDetailsCreen({Key? key}) : super(key: key);

  static String id = "job_details_screen";

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Job Detail',
      back: true,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
