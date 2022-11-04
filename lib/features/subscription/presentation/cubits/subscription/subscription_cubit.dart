import 'package:bloc/bloc.dart';
import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/current_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/upgrade_subscription_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/subscription_params.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final AllSubscriptionUseCase allSubscriptionUseCase;
  final CurrentSubscriptionUseCase currentSubscriptionUseCase;
  final UpgradeSubscriptionUseCase upgradeSubscriptionUseCase;

  SubscriptionCubit({
    required this.allSubscriptionUseCase,
    required this.currentSubscriptionUseCase,
    required this.upgradeSubscriptionUseCase,
  }) : super(SubscriptionState.initial());

  Future<void> allSubscriptions(String token) async {
    emit(state.copyWith(status: SubscriptionStatus.loading));

    Either<Failure, List<Subscription>> subscription =
        await allSubscriptionUseCase.call(TokenParams(token: token));

    subscription.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: SubscriptionStatus.loaded,
        ));
      },
      (List<Subscription> subscriptions) {
        emit(state.copyWith(
          subscriptions: subscriptions,
        ));
      },
    );
  }

  Future<void> currentSubscriptions(String token) async {
    Either<Failure, String> subscription =
        await currentSubscriptionUseCase.call(TokenParams(token: token));

    subscription.fold(
      (Failure failure) {},
      (String name) {
        List<Subscription> data = state.subscriptions;
        List<Subscription> newData = data.map((item) {
          Subscription newItem = item;
          item.name == name
              ? newItem.setIsActive = true
              : newItem.setIsActive = false;
          return newItem;
        }).toList();
        emit(state.copyWith(
          status: SubscriptionStatus.loaded,
          subscriptions: newData,
        ));
      },
    );
  }

  Future<void> upgradeSubscription(String token, String plan) async {
    Either<Failure, String> subscription =
        await upgradeSubscriptionUseCase.call(SubscriptionParams(
            token: token, paymentMethod: 'card', plan: plan));

    subscription.fold(
      (Failure failure) {
        print("failure upgrade");
      },
      (String name) {
        print('name');
      },
    );
  }
}
