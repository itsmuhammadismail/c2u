part of '../job_list_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('4 Jobs Available', style: kHeading2),
              const Spacer(),
              SvgPicture.asset('assets/icons/create.svg'),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return JobCard();
              }),
        ],
      ),
    );
  }
}
