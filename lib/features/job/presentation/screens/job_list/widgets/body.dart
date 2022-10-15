part of '../job_list_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  void fetchJobs() async {
    String token = context.read<UserCubit>().state.user.token;
    String id = context.read<UserCubit>().state.user.id.toString();
    String role = context.read<UserCubit>().state.user.type;
    await context.read<JobsCubit>().getSubbiesJobs(token, id, role);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: context.watch<JobsCubit>().state.status == JobStatus.loaded
          ? Column(
              children: [
                Row(
                  children: [
                    Text(
                        '${context.watch<JobsCubit>().state.jobs.length} Jobs Available',
                        style: kHeading2),
                    const Spacer(),
                    context.read<UserCubit>().state.user.type == "contractor"
                        ? SvgPicture.asset('assets/icons/create.svg')
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 20),
                ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.watch<JobsCubit>().state.jobs.length,
                    itemBuilder: (context, index) {
                      return JobCard(
                          job: context.watch<JobsCubit>().state.jobs[index]);
                    }),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
