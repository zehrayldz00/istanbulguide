import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/data/features/guide/source/guide_remote_data_source.dart';
import 'package:istanbulguidetwo/domain/features/guide/entity/message_entity.dart';

import '../../../../domain/features/guide/repository/guide_repository.dart';

class GuideRepositoryImpl implements GuideRepository{
  final GuideRemoteDataSource remoteDataSource;

  GuideRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> initChatSession() async{
    remoteDataSource.startChat();
  }

  @override
  Future<Either<String, MessageEntity>> sendMessage(String message) async{
    try{
      final model = await remoteDataSource.sendMessageToAi(message);

      return Right(model.toEntity());
    } catch(e) {
      return Left('AI Error: ${e.toString()}');
    }
  }

}