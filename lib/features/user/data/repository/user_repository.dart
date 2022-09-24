import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String userType,
  });

  Future<Either<Failure, String>> forgetPassword({
    required String email,
  });

  Future<Either<Failure, String>> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, String>> accountSetting({
    required String token,
    required String? image,
    required String firstName,
    required String lastName,
    required String userType,
    required String email,
    required String phone,
  });
}
