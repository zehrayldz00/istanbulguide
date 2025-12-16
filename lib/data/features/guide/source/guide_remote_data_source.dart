import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/env/env.dart';
import '../models/message_model.dart';

abstract class GuideRemoteDataSource {
  Future<MessageModel> sendMessageToAi(String message);
  void startChat();
}

class GuideRemoteDataSourceImpl implements GuideRemoteDataSource {
  late final GenerativeModel _model;
  late ChatSession _chatSession;

  GuideRemoteDataSourceImpl() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: Env.geminiApiKey,
      systemInstruction: Content.text(
        'You are a guide who knows everything about Istanbul. Give clear and concise answers without beating around the bush.',
      ),
    );

    startChat();
  }
  @override
  Future<MessageModel> sendMessageToAi(String message) async {
    try {
      final response = await _chatSession.sendMessage(Content.text(message));

      return MessageModel(
        text: response.text ?? "No response was received.",
        isUser: false,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('AI Error: $e');
    }
  }

  @override
  void startChat() {
    _chatSession = _model.startChat(history: []);
  }
}
