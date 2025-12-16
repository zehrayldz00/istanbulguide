import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/domain/features/guide/entity/message_entity.dart';
import 'package:istanbulguidetwo/presentation/features/guide/bloc/guide_state.dart';

import '../../../../domain/features/guide/usecase/send_message_usecase.dart';

class GuideCubit extends Cubit<GuideState> {
  final SendMessageUseCase sendMessageUseCase;

  final List<MessageEntity> _messages = [];

  GuideCubit({required this.sendMessageUseCase}) : super(GuideInitial()) {
    _initChat();
  }

  void _initChat() {
    final welcomeMsg = MessageEntity(
      text:
          "Hi! I'm your Istanbul guide. You can ask me anything about historical sites, food, or transportation. ",
      isUser: false,
      createdAt: DateTime.now(),
    );

    _messages.add(welcomeMsg);
    emit(GuideLoaded(messages: List.from(_messages)));
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMsg = MessageEntity(
      text: text,
      isUser: true,
      createdAt: DateTime.now(),
    );

    _messages.insert(0, userMsg);

    emit(GuideLoaded(messages: List.from(_messages), isTyping: true));

    final result = await sendMessageUseCase.call(params: text);

    result.fold(
      (error) {
        emit(GuideError('Something went wrong.: $error'));

        emit(GuideLoaded(messages: List.from(_messages), isTyping: false));
      },
      (responseEntity) {
        _messages.insert(0, responseEntity);
        emit(GuideLoaded(messages: List.from(_messages), isTyping: false));
      },
    );
  }
}
