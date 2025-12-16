import 'package:dartz/dartz.dart';

import '../entity/message_entity.dart';

abstract class GuideRepository {
  Future<void> initChatSession(); //starts chat and says hi!
  Future<Either<String, MessageEntity>> sendMessage(String message);
  //void clearHistory();
}
