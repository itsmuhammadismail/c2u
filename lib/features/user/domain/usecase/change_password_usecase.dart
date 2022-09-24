import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/password_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUSeCase extends UseCase<String, PasswordParams> {
  final UserRepositoryImpl repository;

  ChangePasswordUSeCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(PasswordParams params) {
    return repository.changePassword(
      token: params.token,
      currentPassword: params.currentPassword,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}
