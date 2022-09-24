import 'package:c2u/features/job/data/datasource/job_remote_datasource.dart';
import 'package:c2u/features/job/data/mapper/dashboard_mapper.dart';
import 'package:c2u/features/job/domain/repository/job_repository_impl.dart';
import 'package:c2u/features/job/domain/usecase/get_dashboard_usecase.dart';
import 'package:c2u/features/subscription/data/datasource/subscription_remote_datasource.dart';
import 'package:c2u/features/subscription/data/mapper/subscription_mapper.dart';
import 'package:c2u/features/subscription/domain/repository/subscription_repository_impl.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/current_subscription_usecase.dart';
import 'package:c2u/features/user/data/datasource/user_remote_datasource.dart';
import 'package:c2u/features/user/data/mapper/user_mapper.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/forget_usecase.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase.dart';
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
    // Get Dashboard Data
    RepositoryProvider<GetDashboardUseCase>(
      create: (context) => GetDashboardUseCase(
        repository: JobRepositoryImpl(
          dashboardMapper: DashboardMapper(),
          jobRemoteDataSource: JobRemoteDataSource(),
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
    // Current Subscription Data
    RepositoryProvider<CurrentSubscriptionUseCase>(
      create: (context) => CurrentSubscriptionUseCase(
        repository: SubscriptionRepositoryImpl(
          subscriptionMapper: SubscriptionMapper(),
          subscriptionRemoteDatasource: SubscriptionRemoteDatasource(),
        ),
      ),
    ),
  ];
}
