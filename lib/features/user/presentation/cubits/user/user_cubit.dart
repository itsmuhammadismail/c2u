import 'dart:convert';

import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/domain/usecase/account_setting_usecase.dart';
import 'package:c2u/features/user/domain/usecase/change_password_usecase.dart';
import 'package:c2u/features/user/domain/usecase/forget_usecase.dart';
import 'package:c2u/features/user/domain/usecase/login_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/account_params.dart';
import 'package:c2u/shared/params/password_params.dart';
import 'package:c2u/shared/params/user_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with HydratedMixin {
// class UserCubit extends Cubit<UserState> {
  final LoginUseCase loginUseCase;
  final ForgetUseCase forgetUseCase;
  final ChangePasswordUSeCase changePasswordUSeCase;
  final AccountSettingUseCase accountSettingUseCase;

  UserCubit({
    required this.loginUseCase,
    required this.forgetUseCase,
    required this.changePasswordUSeCase,
    required this.accountSettingUseCase,
  }) : super(UserState.initial());

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
        print("message $message");
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
        print("message $message");
        return message;
      },
    );

    return "";
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
