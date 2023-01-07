import 'package:c2u/features/chat/domain/usecase/get_messages_usecase.dart';
import 'package:c2u/features/chat/domain/usecase/get_notifications_usecase%20.dart';
import 'package:c2u/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:c2u/features/chat/presentation/cubits/chat/chat_cubit.dart';
import 'package:c2u/features/chat/presentation/cubits/notification/notification_cubit.dart';
import 'package:c2u/features/job/domain/usecase/create_job_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_jobs_usecase.dart';
import 'package:c2u/features/job/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/job/presentation/cubits/subbies_dashboard/subbies_dashboard_cubit.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/cancel_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/current_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/invoices_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/upgrade_subscription_usecase.dart';
import 'package:c2u/features/subscription/presentation/cubits/invoice/invoice_cubit.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/delete_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/forget_usecase.dart';
import 'package:c2u/features/user/domain/usecase/get_contractor_data_usecase.dart';
import 'package:c2u/features/user/domain/usecase/get_subbie_data_usecase.dart';
import 'package:c2u/features/user/domain/usecase/signup_usecase.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase.dart';
import 'package:c2u/features/user/domain/usecase/region_usecase.dart';
import 'package:c2u/features/user/domain/usecase/subbie_usecase.dart';
import 'package:c2u/features/user/domain/usecase/trade_usecase.dart';
import 'package:c2u/features/user/domain/usecase/update_profile_usecase.dart';
import 'package:c2u/features/user/domain/usecase/update_subbie_profile_usecase.dart';
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
        deleteAccountUseCase: context.read<DeleteAccountUseCase>(),
        accountSettingUseCase: context.read<AccountSettingUseCase>(),
        regionUseCase: context.read<RegionUseCase>(),
        tradeUseCase: context.read<TradeUseCase>(),
        subbieUseCase: context.read<SubbieUseCase>(),
        updateProfileUseCase: context.read<UpdateProfileUseCase>(),
        getSubbieDataUseCase: context.read<GetSubbieDataUseCase>(),
        updateContractorProfileUseCase:
            context.read<UpdateContractorProfileUseCase>(),
        getContractorDataUseCase: context.read<GetContractorDataUseCase>(),
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
        createJobUseCase: context.read<CreateJobUseCase>(),
      ),
    ),
    // Subscription
    BlocProvider<SubscriptionCubit>(
      create: (context) => SubscriptionCubit(
        allSubscriptionUseCase: context.read<AllSubscriptionUseCase>(),
        currentSubscriptionUseCase: context.read<CurrentSubscriptionUseCase>(),
        upgradeSubscriptionUseCase: context.read<UpgradeSubscriptionUseCase>(),
        cancelSubscriptionUseCase: context.read<CancelSubscriptionUseCase>(),
      ),
    ),
    // Invoice
    BlocProvider<InvoiceCubit>(
      create: (context) => InvoiceCubit(
        invoicesUseCase: context.read<InvoicesUseCase>(),
      ),
    ),
    // Chat
    BlocProvider<ChatCubit>(
      create: (context) => ChatCubit(
        getMessagesUseCase: context.read<GetMessagesUseCase>(),
        sendMessageUseCase: context.read<SendMessageUseCase>(),
      ),
    ),
    // Notifications
    BlocProvider<NotificationCubit>(
      create: (context) => NotificationCubit(
        getNotificationsUseCase: context.read<GetNotificationsUseCase>(),
      ),
    ),
  ];
}
