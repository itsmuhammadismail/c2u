import 'package:c2u/features/user/domain/repository/user_repository_impl.dart';
import 'package:c2u/features/user/presentation/screens/profile/widgets/contractor_profile_model.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class ContractorProfileParams {
  final String token;
  final ContractorProfileModel profile;

  const ContractorProfileParams({
    required this.token,
    required this.profile,
  });
}

class UpdateContractorProfileUseCase
    extends UseCase<String, ContractorProfileParams> {
  final UserRepositoryImpl repository;

  UpdateContractorProfileUseCase({required this.repository});

  @override
  Future<Either<ServerFailure, String>> call(ContractorProfileParams params) {
    return repository.contractorProfileUpdate(
      token: params.token,
      profile: params.profile,
    );
  }
}
