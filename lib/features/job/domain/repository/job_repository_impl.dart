import 'package:c2u/features/job/data/datasource/job_remote_datasource.dart';
import 'package:c2u/features/job/data/mapper/dashboard_mapper.dart';
import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/features/job/data/repository/job_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';

class JobRepositoryImpl extends JobRepository {
  late JobRemoteDataSource _remoteDataSource;
  late DashboardMapper _mapper;

  JobRepositoryImpl({
    required JobRemoteDataSource jobRemoteDataSource,
    required DashboardMapper dashboardMapper,
  }) {
    _remoteDataSource = jobRemoteDataSource;
    _mapper = dashboardMapper;
  }

  @override
  Future<Either<Failure, Dashboard>> dashboard({required String token}) async {
    try {
      DashboardModel dashboardModel = await _remoteDataSource.dashboard(token);

      Dashboard result = _mapper.mapModeltoEntity(dashboardModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
