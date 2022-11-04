import 'package:c2u/features/job/domain/usecase/get_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_jobs_usecase.dart';
import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/subbies_dashboard/subbies_dashboard_cubit.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/current_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/upgrade_subscription_usecase.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/forget_usecase.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase%20copy.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase.dart';
import 'package:c2u/features/user/domain/usecase/region_usecase.dart';
import 'package:c2u/features/user/domain/usecase/trade_usecase.dart';
import 'package:c2u/features/user/domain/usecase/update_profile_usecase.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    // User
    BlocProvider<UserCubit>(
      create: (context) => UserCubit(
        loginUseCase: context.read<LoginUseCase>(),
        signupUseCase: context.read<SignupUseCase>(),
        forgetUseCase: context.read<ForgetUseCase>(),
        changePasswordUSeCase: context.read<ChangePasswordUSeCase>(),
        accountSettingUseCase: context.read<AccountSettingUseCase>(),
        regionUseCase: context.read<RegionUseCase>(),
        tradeUseCase: context.read<TradeUseCase>(),
        updateProfileUseCase: context.read<UpdateProfileUseCase>(),
      ),
    ),
    // Dashboard
    BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(
        dashboardUseCase: context.read<GetDashboardUseCase>(),
      ),
    ),
    // Subbies Dashboard
    BlocProvider<SubbiesDashboardCubit>(
      create: (context) => SubbiesDashboardCubit(
        subbiesDashboardUseCase: context.read<GetSubbiesDashboardUseCase>(),
      ),
    ),
    // Jobs
    BlocProvider<JobsCubit>(
      create: (context) => JobsCubit(
        subbiesJobsUseCase: context.read<GetSubbiesJobsUseCase>(),
      ),
    ),
    // Subscription
    BlocProvider<SubscriptionCubit>(
      create: (context) => SubscriptionCubit(
        allSubscriptionUseCase: context.read<AllSubscriptionUseCase>(),
        currentSubscriptionUseCase: context.read<CurrentSubscriptionUseCase>(),
        upgradeSubscriptionUseCase: context.read<UpgradeSubscriptionUseCase>(),
      ),
    ),
  ];
}
