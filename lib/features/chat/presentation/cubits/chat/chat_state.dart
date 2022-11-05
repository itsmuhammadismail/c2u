part of 'chat_cubit.dart';

enum ChatStatus {
  initial,
  loading,
  loaded,
  error,
}

class ChatState extends Equatable {
  final ChatStatus status;
  final List<Chat> chats;

  const ChatState({
    required this.status,
    required this.chats,
  });

  factory ChatState.initial() => const ChatState(
        status: ChatStatus.initial,
        chats: [],
      );

  @override
  List<Object> get props => [status, chats];

  @override
  bool get stringify => true;

  ChatState copyWith({
    ChatStatus? status,
    List<Chat>? chats,
  }) {
    return ChatState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
    );
  }
}
