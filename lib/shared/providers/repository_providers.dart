import 'package:c2u/features/chat/data/datasource/chat_datasource.dart';
import 'package:c2u/features/chat/data/datasource/notification_datasource.dart';
import 'package:c2u/features/chat/data/mapper/chat_mapper.dart';
import 'package:c2u/features/chat/data/mapper/notification_mapper.dart';
import 'package:c2u/features/chat/domain/repository/chat_repository_impl.dart';
import 'package:c2u/features/chat/domain/repository/notification_repository_impl.dart';
import 'package:c2u/features/chat/domain/usecase/get_messages_usecase.dart';
import 'package:c2u/features/chat/domain/usecase/get_notifications_usecase%20.dart';
import 'package:c2u/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:c2u/features/job/data/datasource/job_remote_datasource.dart';
import 'package:c2u/features/job/data/mapper/dashboard_mapper.dart';
import 'package:c2u/features/job/data/mapper/job_mapper.dart';
import 'package:c2u/features/job/data/mapper/subbies_dashboard_mapper.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/features/job/domain/usecase/create_job_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_dashboard_usecase.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_jobs_usecase.dart';
import 'package:c2u/features/subscription/data/datasource/invoice_remte_datasource.dart';
import 'package:c2u/features/subscription/data/datasource/subscription_remote_datasource.dart';
import 'package:c2u/features/subscription/data/mapper/invoice_mapper.dart';
import 'package:c2u/features/subscription/data/mapper/subscription_mapper.dart';
import 'package:c2u/features/subscription/domain/repository/invoice_repository_impl.dart';
import 'package:c2u/features/subscription/domain/repository/subscription_repository_impl.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/cancel_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/current_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/invoices_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/upgrade_subscription_usecase.dart';
import 'package:c2u/features/user/data/datasource/user_remote_datasource.dart';
import 'package:c2u/features/user/data/mapper/user_mapper.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryProviders {
  static List<RepositoryProvider> providers = [
    // Login
    RepositoryProvider<LoginUseCase>(
      create: (context) => LoginUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Signup
    RepositoryProvider<SignupUseCase>(
      create: (context) => SignupUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Update Profile
    RepositoryProvider<UpdateProfileUseCase>(
      create: (context) => UpdateProfileUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Update COntractor Profile
    RepositoryProvider<UpdateContractorProfileUseCase>(
      create: (context) => UpdateContractorProfileUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Forget Password
    RepositoryProvider<ForgetUseCase>(
      create: (context) => ForgetUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Change Password
    RepositoryProvider<ChangePasswordUSeCase>(
      create: (context) => ChangePasswordUSeCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Account Setting
    RepositoryProvider<AccountSettingUseCase>(
      create: (context) => AccountSettingUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Trades
    RepositoryProvider<TradeUseCase>(
      create: (context) => TradeUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Regions
    RepositoryProvider<RegionUseCase>(
      create: (context) => RegionUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Subbies
    RepositoryProvider<SubbieUseCase>(
      create: (context) => SubbieUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // GEt Subbies Data
    RepositoryProvider<GetSubbieDataUseCase>(
      create: (context) => GetSubbieDataUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // GEt Contractor Data
    RepositoryProvider<GetContractorDataUseCase>(
      create: (context) => GetContractorDataUseCase(
        repository: UserRepositoryImpl(
          userMapper: UserMapper(),
          userRemoteDataSource: UserRemoteDataSource(),
        ),
      ),
    ),
    // Create Job
    RepositoryProvider<CreateJobUseCase>(
      create: (context) => CreateJobUseCase(
        repository: JobRepositoryImpl(
          dashboardMapper: DashboardMapper(),
          jobRemoteDataSource: JobRemoteDataSource(),
          subbiesDashboardMapper: SubbiesDashboardMapper(),
          jobMapper: JobMapper(),
        ),
      ),
    ),
    // Get Dashboard Data
    RepositoryProvider<GetDashboardUseCase>(
      create: (context) => GetDashboardUseCase(
        repository: JobRepositoryImpl(
          dashboardMapper: DashboardMapper(),
          jobRemoteDataSource: JobRemoteDataSource(),
          subbiesDashboardMapper: SubbiesDashboardMapper(),
          jobMapper: JobMapper(),
        ),
      ),
    ),
    // Get Dashboard Data
    RepositoryProvider<GetSubbiesDashboardUseCase>(
      create: (context) => GetSubbiesDashboardUseCase(
        repository: JobRepositoryImpl(
          dashboardMapper: DashboardMapper(),
          jobRemoteDataSource: JobRemoteDataSource(),
          subbiesDashboardMapper: SubbiesDashboardMapper(),
          jobMapper: JobMapper(),
        ),
      ),
    ),
    // Get Subbies Jobs
    RepositoryProvider<GetSubbiesJobsUseCase>(
      create: (context) => GetSubbiesJobsUseCase(
        repository: JobRepositoryImpl(
          dashboardMapper: DashboardMapper(),
          jobRemoteDataSource: JobRemoteDataSource(),
          subbiesDashboardMapper: SubbiesDashboardMapper(),
          jobMapper: JobMapper(),
        ),
      ),
    ),
    // All Subscription Data
    RepositoryProvider<AllSubscriptionUseCase>(
      create: (context) => AllSubscriptionUseCase(
        repository: SubscriptionRepositoryImpl(
          subscriptionMapper: SubscriptionMapper(),
          subscriptionRemoteDatasource: SubscriptionRemoteDatasource(),
        ),
      ),
    ),
    // AllInvoices
    RepositoryProvider<InvoicesUseCase>(
      create: (context) => InvoicesUseCase(
        repository: InvoiceRepositoryImpl(
          invoiceMapper: InvoiceMapper(),
          invoiceRemoteDataSource: InvoiceRemoteDataSource(),
        ),
      ),
    ),
    // Current Subscription Data
    RepositoryProvider<CurrentSubscriptionUseCase>(
      create: (context) => CurrentSubscriptionUseCase(
        repository: SubscriptionRepositoryImpl(
          subscriptionMapper: SubscriptionMapper(),
          subscriptionRemoteDatasource: SubscriptionRemoteDatasource(),
        ),
      ),
    ),
    // Upgrade Subscription
    RepositoryProvider<UpgradeSubscriptionUseCase>(
      create: (context) => UpgradeSubscriptionUseCase(
        repository: SubscriptionRepositoryImpl(
          subscriptionMapper: SubscriptionMapper(),
          subscriptionRemoteDatasource: SubscriptionRemoteDatasource(),
        ),
      ),
    ),
    // Upgrade Subscription
    RepositoryProvider<CancelSubscriptionUseCase>(
      create: (context) => CancelSubscriptionUseCase(
        repository: SubscriptionRepositoryImpl(
          subscriptionMapper: SubscriptionMapper(),
          subscriptionRemoteDatasource: SubscriptionRemoteDatasource(),
        ),
      ),
    ),
    // Get Chat Messages
    RepositoryProvider<GetMessagesUseCase>(
      create: (context) => GetMessagesUseCase(
        repository: ChatRepositoryImpl(
          chatMapper: ChatMapper(),
          chatDataSource: ChatDataSource(),
        ),
      ),
    ),
    // Send Messages
    RepositoryProvider<SendMessageUseCase>(
      create: (context) => SendMessageUseCase(
        repository: ChatRepositoryImpl(
          chatMapper: ChatMapper(),
          chatDataSource: ChatDataSource(),
        ),
      ),
    ),
    // Notification
    RepositoryProvider<GetNotificationsUseCase>(
      create: (context) => GetNotificationsUseCase(
        repository: NotificationRepositoryImpl(
          notificationMapper: NotificationMapper(),
          notificationDataSource: NotificationDataSource(),
        ),
      ),
    ),
  ];
}
