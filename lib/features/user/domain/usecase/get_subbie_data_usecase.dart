import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSubbieDataUseCase {
  final UserRepositoryImpl repository;

  GetSubbieDataUseCase({required this.repository});

  Future<ProfileModel?> call(TokenParams params) {
    return repository.getSubbiesData(
      token: params.token,
    );
  }
}
