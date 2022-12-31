import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/screens/add_job/add_job_screen.dart';
import 'package:c2u/features/job/presentation/screens/dashboard/dashboard_Screen.dart';
import 'package:c2u/features/job/presentation/screens/job_list/job_list_screen.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/billing_subscription_screen.dart';
import 'package:c2u/features/subscription/presentation/screens/invoices/invoice_screen.dart';
import 'package:c2u/features/subscription/presentation/screens/subscription/subscription_screen.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/features/user/presentation/screens/account_setting/accout_setting.dart';
import 'package:c2u/features/user/presentation/screens/change_password/change_password_screen.dart';
import 'package:c2u/features/user/presentation/screens/find_subbie/find_subbie_screen.dart';
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
  List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    var status = context.watch<UserCubit>().state.user.status;
    String type = context.read<UserCubit>().state.user.type;

    return Drawer(
      backgroundColor: kPrimaryColor.withOpacity(0.9),
      child: SafeArea(
        child: SingleChildScrollView(
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
                type == 'contractor'
                    ? ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/drawer/job.svg',
                              width: 18,
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              'Job',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        textColor: Colors.white,
                        trailing: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: listItem(
                              context,
                              name: "All Jobs",
                              icon: 'assets/icons/drawer/job.svg',
                              navigateTo: status == 'active'
                                  ? JobListScreen.id
                                  : BillingSubscriptionScreen.id,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: listItem(
                              context,
                              name: "Add New",
                              icon: 'assets/icons/drawer/job.svg',
                              navigateTo: status == 'active'
                                  ? AddJobScreen.id
                                  : BillingSubscriptionScreen.id,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: listItem(
                              context,
                              name: "Find Subbie",
                              icon: 'assets/icons/drawer/job.svg',
                              navigateTo: status == 'active'
                                  ? FindSubbieScreen.id
                                  : BillingSubscriptionScreen.id,
                            ),
                          ),
                        ],
                      )
                    : listItem(
                        context,
                        name: "Job Requests",
                        icon: 'assets/icons/drawer/job.svg',
                        navigateTo: status == 'active'
                            ? JobListScreen.id
                            : BillingSubscriptionScreen.id,
                      ),
                const SizedBox(height: 10),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/drawer/subscription.svg',
                        width: 18,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Subscription',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                  trailing: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.white),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: listItem(
                        context,
                        name: "Subscription",
                        icon: 'assets/icons/drawer/Subscription_1.svg',
                        navigateTo: SubscriptionScreen.id,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: listItem(
                        context,
                        name: "Billing",
                        icon: 'assets/icons/drawer/Billing.svg',
                        navigateTo: BillingSubscriptionScreen.id,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: listItem(
                        context,
                        name: "Invoices",
                        icon: 'assets/icons/drawer/Invoice.svg',
                        navigateTo: InvoiceScreen.id,
                      ),
                    ),
                  ],
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
                // ),
              ],
            ),
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
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
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
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
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
      ),
    );
  }
}
