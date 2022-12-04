import 'dart:convert';

import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/forget_usecase.dart';
import 'package:c2u/features/user/domain/usecase/get_contractor_data_usecase.dart';
import 'package:c2u/features/user/domain/usecase/get_subbie_data_usecase.dart';
import 'package:c2u/features/user/domain/usecase/signup_usecase.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase.dart';
import 'package:c2u/features/user/domain/usecase/region_usecase.dart';
import 'package:c2u/features/user/domain/usecase/subbie_usecase.dart';
import 'package:c2u/features/user/domain/usecase/trade_usecase.dart';
import 'package:c2u/features/user/domain/usecase/update_profile_usecase.dart';
import 'package:c2u/features/user/domain/usecase/update_subbie_profile_usecase.dart';
import 'package:c2u/features/user/presentation/screens/profile/widgets/contractor_profile_model.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/account_params.dart';
import 'package:c2u/shared/params/password_params.dart';
import 'package:c2u/shared/params/profile_params.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/params/user_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with HydratedMixin {
// class UserCubit extends Cubit<UserState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final ForgetUseCase forgetUseCase;
  final ChangePasswordUSeCase changePasswordUSeCase;
  final AccountSettingUseCase accountSettingUseCase;
  final TradeUseCase tradeUseCase;
  final RegionUseCase regionUseCase;
  final SubbieUseCase subbieUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetSubbieDataUseCase getSubbieDataUseCase;
  final UpdateContractorProfileUseCase updateContractorProfileUseCase;
  final GetContractorDataUseCase getContractorDataUseCase;

  UserCubit({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.forgetUseCase,
    required this.changePasswordUSeCase,
    required this.accountSettingUseCase,
    required this.tradeUseCase,
    required this.regionUseCase,
    required this.subbieUseCase,
    required this.updateProfileUseCase,
    required this.getSubbieDataUseCase,
    required this.updateContractorProfileUseCase,
    required this.getContractorDataUseCase,
  }) : super(UserState.initial());

  void initial() {
    emit(state.copyWith(
      status: UserStatus.initial,
      user: User.initial(),
    ));
  }

  Future<void> login(String email, String password, String userType) async {
    emit(state.copyWith(status: UserStatus.loading));

    Either<Failure, User> user = await loginUseCase.call(UserParams(
      email: email,
      password: password,
      userType: userType,
    ));

    user.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: UserStatus.error,
        ));
      },
      (User user) {
        emit(state.copyWith(
          status: UserStatus.loaded,
          user: user,
        ));
      },
    );
  }

  Future<void> signup(SubbieSignup subbie) async {
    emit(state.copyWith(status: UserStatus.loading));

    Either<Failure, User> user = await signupUseCase.call(subbie);

    user.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: UserStatus.error,
        ));
      },
      (User user) {
        emit(state.copyWith(
          status: UserStatus.loaded,
          user: user,
        ));
      },
    );
  }

  Future<String> forgetPassword(String email) async {
    Either<Failure, String> user = await forgetUseCase.call(UserParams(
      email: email,
    ));

    user.fold(
      (Failure failure) {
        return "Email address doesn't exist";
      },
      (String message) {
        return message;
      },
    );

    return "";
  }

  Future<String> updateProfile(String token, ProfileModel profile) async {
    Either<ServerFailure, String> result =
        await updateProfileUseCase.call(ProfileParams(
      token: token,
      profile: profile,
    ));

    String resultMessage = "";

    result.fold(
      (ServerFailure failure) {
        resultMessage = failure.message;
      },
      (String message) {
        resultMessage = message;
      },
    );

    return resultMessage;
  }

  Future<String> updateContractorProfile(
      String token, ContractorProfileModel profile) async {
    Either<ServerFailure, String> result =
        await updateContractorProfileUseCase.call(ContractorProfileParams(
      token: token,
      profile: profile,
    ));

    String resultMessage = "";

    result.fold(
      (ServerFailure failure) {
        resultMessage = failure.message;
      },
      (String message) {
        resultMessage = message;
      },
    );

    return resultMessage;
  }

  Future<String> changePassword(String token, String currentPassword,
      String password, String confirmPassword) async {
    Either<Failure, String> user =
        await changePasswordUSeCase.call(PasswordParams(
      token: token,
      currentPassword: currentPassword,
      password: password,
      confirmPassword: confirmPassword,
    ));

    user.fold(
      (Failure failure) {
        return "error";
      },
      (String message) {
        return message;
      },
    );

    return "";
  }

  Future<String> accountSettings(
    String token,
    String? image,
    String firstName,
    String lastName,
    String userType,
    String email,
    String phone,
  ) async {
    Either<Failure, String> account =
        await accountSettingUseCase.call(AccountParams(
      token: token,
      image: image,
      firstName: firstName,
      lastName: lastName,
      userType: userType,
      email: email,
      phone: phone,
    ));

    account.fold(
      (Failure failure) {
        return "error";
      },
      (String message) {
        return message;
      },
    );

    return "";
  }

  Future<List<Trade>> getTrades(
    String token,
  ) async {
    Either<Failure, List<Trade>> trades = await tradeUseCase.call(TokenParams(
      token: token,
    ));

    List<Trade> myTrades = [];

    trades.fold(
      (Failure failure) {
        myTrades = [];
      },
      (List<Trade> trade) {
        myTrades = trade;
      },
    );

    return myTrades;
  }

  Future<List<Region>> getRegions(
    String token,
  ) async {
    Either<Failure, List<Region>> regions =
        await regionUseCase.call(TokenParams(
      token: token,
    ));

    List<Region> myRegions = [];

    regions.fold(
      (Failure failure) {
        myRegions = [];
      },
      (List<Region> region) {
        myRegions = region;
      },
    );

    return myRegions;
  }

  Future<List<Subbie>> getSubbies(
    String token, {
    String? url,
  }) async {
    Either<Failure, List<Subbie>> subbies =
        await subbieUseCase.call(TokenParams(
      token: token,
      url: url,
    ));

    List<Subbie> mySubbies = [];

    subbies.fold(
      (Failure failure) {
        mySubbies = [];
      },
      (List<Subbie> region) {
        mySubbies = region;
      },
    );

    return mySubbies;
  }

  Future<ProfileModel?> getSubbiesData(
    String token,
  ) async {
    ProfileModel? profile = await getSubbieDataUseCase.call(TokenParams(
      token: token,
    ));

    return profile;
  }

  Future<ContractorProfileModel?> getContractorData(
    String token,
  ) async {
    ContractorProfileModel profile =
        await getContractorDataUseCase.call(TokenParams(
      token: token,
    ));

    print("contractor $profile");

    return profile;
  }

  void updateStatus() {
    User user = state.user;
    user.status = 'active';
    emit(state.copyWith(
      user: user,
    ));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
