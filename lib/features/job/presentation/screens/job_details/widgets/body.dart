part of '../job_details_Screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Text(
                    'Australia',
                    style: TextStyle(
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
                  const Text(
                    '1 day ago',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Description',
            style: kHeading3,
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,',
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Work Order',
            style: kHeading3,
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xFFFECD07),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
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
