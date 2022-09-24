import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/account_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class AccountSettingUseCase extends UseCase<String, AccountParams> {
  final UserRepositoryImpl repository;

  AccountSettingUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(AccountParams params) {
    return repository.accountSetting(
      token: params.token,
      image: params.image,
      firstName: params.firstName,
      lastName: params.lastName,
      userType: params.userType,
      email: params.email,
      phone: params.phone,
    );
  }
}
