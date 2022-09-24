import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/job/presentation/screens/job_list/job_list_screen.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/billing_subscription_screen.dart';
import 'package:c2u/features/user/presentation/screens/account_setting/accout_setting.dart';
import 'package:c2u/features/user/presentation/screens/change_password/change_password_screen.dart';
import 'package:c2u/features/user/presentation/screens/profile/profile_screen.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/shared/routes/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                navigateTo: DashbaordScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Request a Job",
                icon: 'assets/icons/drawer/job.svg',
                navigateTo: JobListScreen.id,
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
                navigateTo: ProfileScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Account Setting",
                icon: 'assets/icons/drawer/setting.svg',
                navigateTo: AccountSettingScreen.id,
              ),
              const SizedBox(height: 10),
              listItem(
                context,
                name: "Change Password",
                icon: 'assets/icons/drawer/change.svg',
                navigateTo: ChangePasswordScreen.id,
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
}
