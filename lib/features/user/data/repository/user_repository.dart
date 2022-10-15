import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String userType,
  });

  Future<Either<Failure, User>> signup({
    required SubbieSignup subbie,
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

  Future<Either<ServerFailure, String>> profileUpdate({
    required String token,
    required ProfileModel profile,
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

  Future<Either<Failure, List<Trade>>> getTrades({
    required String token,
  });

  Future<Either<Failure, List<Region>>> getRegions({
    required String token,
  });
}
