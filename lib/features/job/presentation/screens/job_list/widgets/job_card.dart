import 'package:c2u/features/job/presentation/screens/job_details/job_details_Screen.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigate.to(context, JobDetailsCreen.id),
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
                  const Text(
                    'Technical Issue',
                    style: TextStyle(
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
                    child: const Text(
                      'Pending',
                      style: TextStyle(color: Color(0xFFE24E06)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text(
                    'Contractor',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$150 - \$200',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/map_pin.svg'),
                      const SizedBox(width: 8),
                      const Text(
                        'Australia',
                        style: TextStyle(
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
                      const Text(
                        '1 day ago',
                        style: TextStyle(
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
