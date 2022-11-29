import 'package:c2u/features/user/data/datasource/user_remote_datasource.dart';
import 'package:c2u/features/user/data/mapper/user_mapper.dart';
import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/features/user/data/repository/user_repository.dart';
import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
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
  Future<Either<Failure, User>> signup({
    required SubbieSignup subbie,
  }) async {
    try {
      UserModel userModel = await _remoteDataSource.signup(subbie);

      User result = _mapper.mapModeltoEntity(userModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> profileUpdate({
    required String token,
    required ProfileModel profile,
  }) async {
    try {
      String result = await _remoteDataSource.updateProfile(token, profile);

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

  @override
  Future<Either<Failure, List<Region>>> getRegions(
      {required String token}) async {
    try {
      List<Region> regions = await _remoteDataSource.regions(
        token,
      );

      return Right(regions);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Trade>>> getTrades(
      {required String token}) async {
    try {
      List<Trade> trades = await _remoteDataSource.trade(
        token,
      );

      return Right(trades);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Subbie>>> getSubbies(
      {required String token}) async {
    try {
      List<Subbie> subbies = await _remoteDataSource.subbies(
        token,
      );

      return Right(subbies);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getSubbiesData({
    required String token,
  }) async {
    try {
      ProfileModel profile = await _remoteDataSource.getSubbiesData(
        token,
      );

      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
