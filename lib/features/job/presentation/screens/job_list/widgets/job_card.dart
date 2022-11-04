import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/presentation/screens/job_details/job_details_screen.dart';
import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:dartx/dartx.dart';

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({
    required this.job,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(job.day);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDetailsCreen(
                    job: job,
                  )),
        ),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    job.name,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFE6207).withOpacity(0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      job.status.capitalize(),
                      style: const TextStyle(color: Color(0xFFE24E06)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    job.contractor,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  // const Text(
                  //   '\$150 - \$200',
                  //   style: TextStyle(fontWeight: FontWeight.w500),
                  // ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/map_pin.svg'),
                      const SizedBox(width: 8),
                      Text(
                        job.state,
                        style: const TextStyle(
                          color: Color(0xFF967904),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/time.svg'),
                      const SizedBox(width: 8),
                      Text(
                        timeago.format(date).capitalize(),
                        style: const TextStyle(
                          color: Color(0xFF967904),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
