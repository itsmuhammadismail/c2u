import 'package:c2u/features/subscription/data/datasource/subscription_remote_datasource.dart';
import 'package:c2u/features/subscription/data/mapper/subscription_mapper.dart';
import 'package:c2u/features/subscription/data/model/subscription_model.dart';
import 'package:c2u/features/subscription/data/repository/subscription_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';

class SubscriptionRepositoryImpl extends SubscriptionRepository {
  late SubscriptionRemoteDatasource _remoteDataSource;
  late SubscriptionMapper _mapper;

  SubscriptionRepositoryImpl({
    required SubscriptionRemoteDatasource subscriptionRemoteDatasource,
    required SubscriptionMapper subscriptionMapper,
  }) {
    _remoteDataSource = subscriptionRemoteDatasource;
    _mapper = subscriptionMapper;
  }
  @override
  Future<Either<Failure, List<Subscription>>> allSubscriptions(
      {required String token}) async {
    try {
      print("pass in repository 0");
      List<SubscriptionModel> subscriptionModel =
          await _remoteDataSource.allSubscriptions(token);
      print("pass in repository 1");
      List<Subscription> result = subscriptionModel
          .map<Subscription>((data) => _mapper.mapModeltoEntity(data))
          .toList();
      print("pass in repository 2");
      return Right(result);
    } catch (e) {
      print("fail in repository");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map?>> currentSubscription(
      {required String token}) async {
    try {
      Map? subscription = await _remoteDataSource.currentSubscription(token);

      return Right(subscription);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> upgradeSubscription({
    required String token,
    required String paymentMethod,
    required String plan,
  }) async {
    try {
      String subscription = await _remoteDataSource.upgradeSubscription(
        token,
        paymentMethod,
        plan,
      );

      return Right(subscription);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelSubscription(
      {required String token, required String name}) async {
    try {
      bool subscription =
          await _remoteDataSource.cancelSubscription(token, name);

      return Right(subscription);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
