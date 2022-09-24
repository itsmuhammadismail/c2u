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
      List<SubscriptionModel> subscriptionModel =
          await _remoteDataSource.allSubscriptions(token);

      List<Subscription> result = subscriptionModel
          .map<Subscription>((data) => _mapper.mapModeltoEntity(data))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> currentSubscription({required String token}) async {
    try {
      String subscription =
          await _remoteDataSource.currentSubscription(token);

     

      return Right(subscription);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
