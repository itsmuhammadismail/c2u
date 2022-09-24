part of '../dashboard_Screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Welcome ${context.read<UserCubit>().state.user.firstName}!",
              style: kHeading2,
            ),
          ),
          const SizedBox(height: 30),
          const JobsGrid(),
        ],
      ),
    );
  }
}
