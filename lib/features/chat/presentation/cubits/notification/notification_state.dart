part of 'notification_cubit.dart';

enum NotifcationStatus {
  initial,
  loading,
  loaded,
  error,
}

class NotifcationState extends Equatable {
  final NotifcationStatus status;
  final List<NotificationEntity> notifications;

  const NotifcationState({
    required this.status,
    required this.notifications,
  });

  factory NotifcationState.initial() => const NotifcationState(
        status: NotifcationStatus.initial,
        notifications: [],
      );

  @override
  List<Object> get props => [status, notifications];

  @override
  bool get stringify => true;

  NotifcationState copyWith({
    NotifcationStatus? status,
    List<NotificationEntity>? notification,
  }) {
    return NotifcationState(
      status: status ?? this.status,
      notifications: notification ?? this.notifications,
    );
  }
}
