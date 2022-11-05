import 'package:c2u/features/chat/data/datasource/chat_datasource.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl {
  late ChatDataSource _remoteDataSource;

  Future<Either<Failure, bool>> sendMessage({
    required String token,
    required String jobId,
    required String message,
  }) async {
    try {
      // DashboardModel dashboardModel = await _remoteDataSource.dashboard(token);

      bool result = true;
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
