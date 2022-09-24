import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/screens/dashboard/widgets/jobs_grid.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class DashbaordScreen extends StatefulWidget {
  const DashbaordScreen({Key? key}) : super(key: key);

  static String id = "dashbaord_screen";

  @override
  State<DashbaordScreen> createState() => _DashbaordScreenState();
}

class _DashbaordScreenState extends State<DashbaordScreen> {
  @override
  void initState() {
    super.initState();
    print("hello");
    fetchDashboard();
  }

  void fetchDashboard() async {
    String token = context.read<UserCubit>().state.user.token;
    await context.read<DashboardCubit>().get(token);
  }

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: "Dashboard",
      body: Body(),
    );
  }
}
