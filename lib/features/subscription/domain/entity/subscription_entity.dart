import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String name, duration, status, endsAt;
  bool isActive;

  Subscription({
    required this.name,
    required this.duration,
    required this.status,
    required this.endsAt,
    required this.isActive,
  });

  set setIsActive(bool active) {
    isActive = active;
  }

  factory Subscription.initial() => Subscription(
        name: '',
        duration: '',
        status: '',
        endsAt: '',
        isActive: true,
      );

  @override
  List<Object?> get props => [name, duration, status, endsAt, isActive];

  @override
  bool get stringify => true;
}
