import 'package:dartz/dartz.dart';
import 'package:istanbulguidetwo/core/usecase/usecase.dart';

import '../entity/message_entity.dart';
import '../repository/guide_repository.dart';

class SendMessageUseCase implements UseCase<Either<String, MessageEntity>, String>{
  final GuideRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<String, MessageEntity>> call({String? params}) async{
    if(params == null){
      return Left('Message cannot be empty');
    }
    return await repository.sendMessage(params);
  }
}