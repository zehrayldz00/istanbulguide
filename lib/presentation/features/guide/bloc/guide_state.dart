import 'package:equatable/equatable.dart';

import '../../../../domain/features/guide/entity/message_entity.dart';

abstract class GuideState extends Equatable {
  const GuideState();

  @override
  List<Object?> get props => [];
}

class GuideInitial extends GuideState {}

class GuideLoaded extends GuideState {
  final List<MessageEntity> messages;
  final bool isTyping;

  const GuideLoaded({required this.messages, this.isTyping = false});
  GuideLoaded copyWith({List<MessageEntity>? messages, bool? isTyping}) {
    return GuideLoaded(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
    );
  }

  @override
  List<Object?> get props => [messages, isTyping];
}

class GuideError extends GuideState {
  final String message;

  const GuideError(this.message);

  @override
  List<Object?> get props => [message];
}
