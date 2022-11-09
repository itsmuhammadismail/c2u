import 'package:c2u/features/chat/data/datasource/chat_datasource.dart';
import 'package:c2u/features/chat/data/mapper/chat_mapper.dart';
import 'package:c2u/features/chat/data/model/chat_model.dart';
import 'package:c2u/features/chat/data/repository/chat_repository.dart';
import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl extends ChatRepository {
  late ChatDataSource _remoteDataSource;
  late ChatMapper _mapper;

  ChatRepositoryImpl({
    required ChatDataSource chatDataSource,
    required ChatMapper chatMapper,
  }) {
    _remoteDataSource = chatDataSource;
    _mapper = chatMapper;
  }

  @override
  Future<Either<Failure, String>> sendMessage({
    required String token,
    required String jobId,
    required String message,
  }) async {
    try {
      String result =
          await _remoteDataSource.sendMessage(token, jobId, message);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> allMessages({
    required String token,
    required String jobId,
  }) async {
    try {
      List<ChatModel> chatModels =
          await _remoteDataSource.allMessage(token, jobId);

      List<Chat> result = chatModels
          .map<Chat>((data) => _mapper.mapModeltoEntity(data))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
