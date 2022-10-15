import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/profile_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase extends UseCase<String, ProfileParams> {
  final UserRepositoryImpl repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<ServerFailure, String>> call(ProfileParams params) {
    return repository.profileUpdate(
      token: params.token,
      profile: params.profile,
    );
  }
}
