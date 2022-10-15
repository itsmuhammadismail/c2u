import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String name, duration, durationType, price, status, endsAt;
  bool isActive;

  Subscription({
    required this.name,
    required this.duration,
    required this.durationType,
    required this.price,
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
        durationType: '',
        price: '',
        status: '',
        endsAt: '',
        isActive: true,
      );

  @override
  List<Object?> get props => [name, duration, durationType, price, status, endsAt];

  @override
  bool get stringify => true;
}
