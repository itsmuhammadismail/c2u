import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/password_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountUseCase extends UseCase<String, PasswordParams> {
  final UserRepositoryImpl repository;

  DeleteAccountUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(PasswordParams params) {
    return repository.deletePassword(
      token: params.token,
      password: params.password,
    );
  }
}
