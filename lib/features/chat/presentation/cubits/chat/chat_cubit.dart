import 'package:bloc/bloc.dart';
import 'package:c2u/features/chat/domain/entity/chat_entity.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState.initial());
}
