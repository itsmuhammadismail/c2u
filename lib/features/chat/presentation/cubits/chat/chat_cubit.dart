import 'package:bloc/bloc.dart';
import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:c2u/features/chat/domain/usecase/get_messages_usecase.dart';
import 'package:c2u/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/message_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUseCase getMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit({
    required this.getMessagesUseCase,
    required this.sendMessageUseCase,
  }) : super(ChatState.initial());

  void setToInitial() {
    emit(state.copyWith(status: ChatStatus.initial));
  }

  Future<void> getMessages(String token, int jobId) async {
    // emit(state.copyWith(status: ChatStatus.loading));

    Either<Failure, List<Chat>> chat = await getMessagesUseCase
        .call(MessageParams(token: token, jobId: jobId.toString()));

    print(chat);

    chat.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: ChatStatus.error,
        ));
      },
      (List<Chat> chats) {
        emit(state.copyWith(
          chats: chats.reversed.toList(),
          status: ChatStatus.loaded,
        ));
      },
    );
  }

  Future<void> sendMessage(
      String token, int jobId, String message, int userId) async {
    List<Chat> chatList = state.chats;
    // chatList.insert(0, Chat(id: 0, message: message, userId: userId));
    chatList.add(Chat(id: 0, message: message, userId: userId));
    emit(state.copyWith(
      chats: chatList,
    ));
    Either<Failure, String> chat = await sendMessageUseCase.call(
        MessageParams(token: token, jobId: jobId.toString(), message: message));
    chat.fold(
      (Failure failure) {},
      (String message) {
        getMessages(token, jobId);
      },
    );
  }
}
