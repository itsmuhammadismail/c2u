import 'package:c2u/features/job/data/datasource/job_remote_datasource.dart';
import 'package:c2u/features/job/data/mapper/dashboard_mapper.dart';
import 'package:c2u/features/job/data/mapper/job_mapper.dart';
import 'package:c2u/features/job/data/mapper/subbies_dashboard_mapper.dart';
import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/features/job/data/model/job_model.dart';
import 'package:c2u/features/job/data/model/subbies_dashboard_model.dart';
import 'package:c2u/features/job/data/repository/job_repository.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';

class JobRepositoryImpl extends JobRepository {
  late JobRemoteDataSource _remoteDataSource;
  late DashboardMapper _mapper;
  late SubbiesDashboardMapper _subbiesMapper;
  late JobMapper _jobMapper;

  JobRepositoryImpl({
    required JobRemoteDataSource jobRemoteDataSource,
    required DashboardMapper dashboardMapper,
    required SubbiesDashboardMapper subbiesDashboardMapper,
    required JobMapper jobMapper,
  }) {
    _remoteDataSource = jobRemoteDataSource;
    _mapper = dashboardMapper;
    _subbiesMapper = subbiesDashboardMapper;
    _jobMapper = jobMapper;
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

  @override
  Future<Either<Failure, SubbiesDashboard>> subbieDashboard(
      {required String token}) async {
    try {
      SubbiesDashboardModel dashboardModel =
          await _remoteDataSource.subbiesDashboard(token);

      SubbiesDashboard result = _subbiesMapper.mapModeltoEntity(dashboardModel);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getSubbieJobs(
      {required String token, required String id, required String role}) async {
    try {
      List<JobModel> jobModel =
          await _remoteDataSource.getSubbiesJobs(token, id, role);

      List<Job> result =
          jobModel.map<Job>((job) => _jobMapper.mapModeltoEntity(job)).toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
