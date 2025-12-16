import 'package:istanbulguidetwo/domain/features/guide/entity/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.text,
    required super.isUser,
    required super.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'] ?? '',
      isUser: json['role'] == 'user',
      createdAt: DateTime.parse(json['timestamp']),
    );
  }

  // Extension: Model -> Entity
  MessageEntity toEntity() {
    return MessageEntity(
      text: text,
      isUser: isUser,
      createdAt: createdAt,
    );
  }
}
