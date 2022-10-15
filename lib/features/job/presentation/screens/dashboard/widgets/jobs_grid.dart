import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/subbies_dashboard/subbies_dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/screens/dashboard/widgets/card_model.dart';
import 'package:c2u/features/job/presentation/screens/dashboard/widgets/dashboard_card.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsGrid extends StatefulWidget {
  const JobsGrid({Key? key}) : super(key: key);

  @override
  State<JobsGrid> createState() => _JobsGridState();
}

class _JobsGridState extends State<JobsGrid> {
  @override
  Widget build(BuildContext context) {
    List<CardModel> cards = context.watch<UserCubit>().state.user.type ==
            "contractor"
        ? [
            CardModel(
              name: "Jobs Running",
              value:
                  context.watch<DashboardCubit>().state.dashboard.jobsRunning,
              icon: "assets/icons/card-1.svg",
              color: const Color(0xFF24336A),
            ),
            CardModel(
              name: "Jobs Allocated",
              value:
                  context.watch<DashboardCubit>().state.dashboard.jobsAllocated,
              icon: "assets/icons/card-2.svg",
              color: const Color(0xFF4191FF),
            ),
            CardModel(
              name: "Closed / Finished Jobs",
              value:
                  context.watch<DashboardCubit>().state.dashboard.finishedJobs,
              icon: "assets/icons/card-3.svg",
              color: const Color(0xFFF83245),
            ),
            CardModel(
              name: "Pending Excess Work",
              value: context
                  .watch<DashboardCubit>()
                  .state
                  .dashboard
                  .pendingExcessWork,
              icon: "assets/icons/card-4.svg",
              color: const Color(0xFFF4772E),
            ),
            CardModel(
              name: "Open Jobs",
              value: context.watch<DashboardCubit>().state.dashboard.openJobs,
              icon: "assets/icons/card-5.svg",
              color: const Color(0xFF3C44B1),
            ),
            CardModel(
              name: "Approved Excess Work",
              value: context
                  .watch<DashboardCubit>()
                  .state
                  .dashboard
                  .approvedExcessWork,
              icon: "assets/icons/card-6.svg",
              color: const Color(0xFF11C5DB),
            ),
          ]
        : [
            CardModel(
              name: "Accepted Job Requests",
              value: context
                  .watch<SubbiesDashboardCubit>()
                  .state
                  .dashboard
                  .acceptedJobs,
              icon: "assets/icons/card-6.svg",
              color: const Color(0xFF24336A),
            ),
            CardModel(
              name: "Pending Job Request",
              value: context
                  .watch<SubbiesDashboardCubit>()
                  .state
                  .dashboard
                  .pendingJobs,
              icon: "assets/icons/card-7.svg",
              color: const Color(0xFF4191FF),
            ),
            CardModel(
              name: "Completed Job Request",
              value: context
                  .watch<SubbiesDashboardCubit>()
                  .state
                  .dashboard
                  .completedJobs,
              icon: "assets/icons/card-2.svg",
              color: const Color(0xFF48b712),
            ),
          ];

    return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              context.watch<UserCubit>().state.user.type == "contractor"
                  ? 1
                  : 4 / 2,
          crossAxisCount:
              context.watch<UserCubit>().state.user.type == "contractor"
                  ? 2
                  : 1,

          // crossAxisSpacing: 20,
          // mainAxisSpacing: 20,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return DashboardCard(card: cards[index]);
        });
  }
}
