import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String name, duration, durationType, price, status, userType;
  final String? trialEndsAt, endsAt;
  String? startedDate, nextBillingDate;
  bool isActive;

  Subscription({
    required this.name,
    required this.duration,
    required this.durationType,
    required this.price,
    required this.status,
    required this.endsAt,
    required this.trialEndsAt,
    required this.isActive,
    required this.userType,
    required this.startedDate,
    required this.nextBillingDate,
  });

  set setIsActive(bool active) {
    isActive = active;
  }

  set setStartedDate(String active) {
    startedDate = active;
  }

  set setNextBillingDate(String active) {
    nextBillingDate = active;
  }

  factory Subscription.initial() => Subscription(
        name: '',
        duration: '',
        durationType: '',
        price: '',
        status: '',
        trialEndsAt: null,
        endsAt: null,
        startedDate: null,
        nextBillingDate: null,
        isActive: true,
        userType: '',
      );

  @override
  List<Object?> get props => [
        name,
        duration,
        durationType,
        price,
        status,
        endsAt,
        trialEndsAt,
        userType
      ];

  @override
  bool get stringify => true;
}
