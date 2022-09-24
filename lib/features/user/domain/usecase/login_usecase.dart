import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/user_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<User, UserParams> {
  final UserRepositoryImpl repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(UserParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
      userType: params.userType,
    );
  }
}
