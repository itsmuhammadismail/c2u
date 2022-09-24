import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/user_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class ForgetUseCase extends UseCase<String, UserParams> {
  final UserRepositoryImpl repository;

  ForgetUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(UserParams params) {
    return repository.forgetPassword(
      email: params.email,
    );
  }
}
