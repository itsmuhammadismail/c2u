import 'package:c2u/features/user/data/datasource/user_remote_datasource.dart';
import 'package:c2u/features/user/data/mapper/user_mapper.dart';
import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/features/user/data/repository/user_repository.dart';
import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  late UserRemoteDataSource _remoteDataSource;
  late UserMapper _mapper;

  UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
    required UserMapper userMapper,
  }) {
    _remoteDataSource = userRemoteDataSource;
    _mapper = userMapper;
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String userType,
  }) async {
    try {
      UserModel userModel =
          await _remoteDataSource.login(email, password, userType);

      User result = _mapper.mapModeltoEntity(userModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(
      {required String email}) async {
    try {
      String message = await _remoteDataSource.forgetPassword(email);

      return Right(message);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      String message = await _remoteDataSource.changePassword(
        token,
        currentPassword,
        password,
        confirmPassword,
      );

      return Right(message);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> accountSetting({
    required String token,
    required String? image,
    required String firstName,
    required String lastName,
    required String userType,
    required String email,
    required String phone,
  }) async {
    try {
      String message = await _remoteDataSource.accountSetting(
        token,
        image,
        firstName,
        lastName,
        userType,
        email,
        phone,
      );

      return Right(message);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
