// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subscription_cubit.dart';

enum SubscriptionStatus {
  initial,
  loading,
  loaded,
  error,
}

class SubscriptionState extends Equatable {
  final SubscriptionStatus status;
  final List<Subscription> subscriptions;

  const SubscriptionState({
    required this.status,
    required this.subscriptions,
  });

  factory SubscriptionState.initial() => const SubscriptionState(
        status: SubscriptionStatus.initial,
        subscriptions: [],
      );

  @override
  List<Object> get props => [status, subscriptions];

  @override
  bool get stringify => true;

  SubscriptionState copyWith({
    SubscriptionStatus? status,
    List<Subscription>? subscriptions,
  }) {
    return SubscriptionState(
      status: status ?? this.status,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }
}
