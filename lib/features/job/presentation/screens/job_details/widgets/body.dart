part of '../job_details_Screen.dart';

class Body extends StatelessWidget {
  final Job job;
  const Body({required this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(job.day);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              // Text(
              //   '\$150 - \$200',
              //   style: TextStyle(fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/map_pin.svg',
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    job.state,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/time.svg',
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeago.format(date).capitalize(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Description',
            style: kHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            job.desc,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Work Order',
            style: kHeading3,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xFFFECD07),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: const [
                Text('Check Work Order'),
                Spacer(),
                Icon(Icons.arrow_forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}
