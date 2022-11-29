import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase extends UseCase<User, SubbieSignup> {
  final UserRepositoryImpl repository;

  SignupUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(SubbieSignup params) {
    return repository.signup(
      subbie: params,
    );
  }
}
