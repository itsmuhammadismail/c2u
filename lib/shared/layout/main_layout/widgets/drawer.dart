import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/job/presentation/screens/job_list/job_list_screen.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/billing_subscription_screen.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/account_setting/accout_setting.dart';
import 'package:c2u/features/user/presentation/screens/change_password/change_password_screen.dart';
import 'package:c2u/features/user/presentation/screens/profile/profile_screen.dart';
import 'package:c2u/features/user/presentation/screens/select_role/select_role_screen.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/subbie_profile_screen.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    var status = context.watch<UserCubit>().state.user.status;
    return Drawer(
      backgroundColor: kPrimaryColor.withOpacity(0.9),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              listItem(
                context,
                name: "Dashboard",
                icon: 'assets/icons/drawer/dashboard.svg',
                navigateTo: status == 'active'
                    ? DashbaordScreen.id
                    : BillingSubscriptionScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Request a Job",
                icon: 'assets/icons/drawer/job.svg',
                navigateTo: status == 'active'
                    ? JobListScreen.id
                    : BillingSubscriptionScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Billing Subscription",
                icon: 'assets/icons/drawer/subscription.svg',
                navigateTo: BillingSubscriptionScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Profile",
                icon: 'assets/icons/drawer/profile.svg',
                navigateTo:
                    context.read<UserCubit>().state.user.type == "contractor"
                        ? ProfileScreen.id
                        : SubbieProfileScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Account Setting",
                icon: 'assets/icons/drawer/setting.svg',
                navigateTo: status == 'active'
                    ? AccountSettingScreen.id
                    : BillingSubscriptionScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Change Password",
                icon: 'assets/icons/drawer/change.svg',
                navigateTo: status == 'active'
                    ? ChangePasswordScreen.id
                    : BillingSubscriptionScreen.id,
              ),
              const SizedBox(height: 10),
              listItemNext(
                context,
                name: "Logout",
                icon: 'assets/icons/drawer/logout.svg',
                navigateTo: SelectRoleScreen.id,
              ),
              // const ExpansionTile(
              //   title: Text("Expansion Title", style: TextStyle(),),
              //   children: [
              //     Align(
              //       alignment: Alignment.topLeft,
              //       child: Text("children 1"),
              //     ),
              //     Text("children 2")
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(BuildContext context,
      {required String name,
      required String icon,
      required String navigateTo}) {
    return GestureDetector(
      onTap: () => Navigate.to(context, navigateTo),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 18,
            ),
            const SizedBox(width: 15),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listItemNext(BuildContext context,
      {required String name,
      required String icon,
      required String navigateTo}) {
    return GestureDetector(
      onTap: () {
        context.read<UserCubit>().initial();
        context.read<SubscriptionCubit>().initial();
        context.read<DashboardCubit>().initial();
        context.read<JobsCubit>().initial();
        Navigate.next(context, navigateTo);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 18,
            ),
            const SizedBox(width: 15),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
