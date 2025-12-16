import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable{
  final String text;
  final bool isUser;
  final DateTime createdAt;

  const MessageEntity({
    required this.text,
    required this.isUser,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [text, isUser, createdAt];


}
