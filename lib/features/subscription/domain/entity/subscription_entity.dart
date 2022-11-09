import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String name, duration, durationType, price, status, userType;
  final String? endsAt;
  bool isActive;

  Subscription({
    required this.name,
    required this.duration,
    required this.durationType,
    required this.price,
    required this.status,
    required this.endsAt,
    required this.isActive,
    required this.userType,
  });

  set setIsActive(bool active) {
    isActive = active;
  }

  factory Subscription.initial() => Subscription(
        name: '',
        duration: '',
        durationType: '',
        price: '',
        status: '',
        endsAt: '',
        isActive: true,
        userType: ''
      );

  @override
  List<Object?> get props =>
      [name, duration, durationType, price, status, endsAt, userType];

  @override
  bool get stringify => true;
}
