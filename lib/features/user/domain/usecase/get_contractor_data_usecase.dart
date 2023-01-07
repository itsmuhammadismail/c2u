import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/presentation/screens/profile/widgets/contractor_profile_model.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetContractorDataUseCase {
  final UserRepositoryImpl repository;

  GetContractorDataUseCase({required this.repository});

  @override
  Future<ContractorProfileModel> call(TokenParams params) {
    return repository.getContractorData(
      token: params.token,
      url: params.url!,
    );
  }
}
