import 'package:bloc/bloc.dart';
import 'package:c2u/features/chat/domain/entity/notification_entity.dart';
import 'package:c2u/features/chat/domain/usecase/get_notifications_usecase%20.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/message_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotifcationState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationCubit({
    required this.getNotificationsUseCase,
  }) : super(NotifcationState.initial());

  Future<void> getNotifications(String token, int id) async {
    Either<Failure, List<NotificationEntity>> notification =
        await getNotificationsUseCase
            .call(MessageParams(token: token, jobId: id.toString()));

    notification.fold(
      (Failure failure) {
        print("notification error");
        emit(state.copyWith(
          status: NotifcationStatus.error,
        ));
      },
      (List<NotificationEntity> notification) {
        print(notification);
        emit(state.copyWith(
          notification: notification.reversed.toList(),
          status: NotifcationStatus.loaded,
        ));
      },
    );
  }
}
