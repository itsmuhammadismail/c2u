import 'package:bloc/bloc.dart';
import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/domain/usecase/all_subscription_usecase.dart';
import 'package:c2u/features/subscription/domain/usecase/cancel_subscription_usecase.dart';
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
  final CancelSubscriptionUseCase cancelSubscriptionUseCase;

  SubscriptionCubit({
    required this.allSubscriptionUseCase,
    required this.currentSubscriptionUseCase,
    required this.upgradeSubscriptionUseCase,
    required this.cancelSubscriptionUseCase,
  }) : super(SubscriptionState.initial());

  void initial() {
    emit(state.copyWith(status: SubscriptionStatus.initial, subscriptions: []));
  }

  Future<void> allSubscriptions(String token) async {
    emit(state.copyWith(status: SubscriptionStatus.loading));
    print("all subscriptions");

    Either<Failure, List<Subscription>> subscription =
        await allSubscriptionUseCase.call(TokenParams(token: token));

    subscription.fold(
      (Failure failure) {
        print("failure");
        emit(state.copyWith(
          status: SubscriptionStatus.loaded,
        ));
      },
      (List<Subscription> subscriptions) {
        print("subs");
        emit(state.copyWith(
          subscriptions: subscriptions,
        ));
      },
    );
  }

  Future<void> currentSubscriptions(String token) async {
    Either<Failure, Map?> subscription =
        await currentSubscriptionUseCase.call(TokenParams(token: token));

    subscription.fold(
      (Failure failure) {},
      (Map? sub) {
        if (sub != null) {
          List<Subscription> data = state.subscriptions;
          print(sub);
          print(data);
          List<Subscription> newData = data.map((item) {
            Subscription newItem = item;
            if (item.name == sub['name']) {
              newItem.setIsActive = true;
              newItem.setStartedDate = sub['started_date'];
              newItem.setNextBillingDate = sub['next_billing_date'];
            } else {
              newItem.setIsActive = false;
            }
            return newItem;
          }).toList();
          emit(state.copyWith(
            status: SubscriptionStatus.loaded,
            subscriptions: newData,
          ));
        }
      },
    );
  }

  Future<bool> upgradeSubscription(String token, String plan) async {
    Either<Failure, String> subscription =
        await upgradeSubscriptionUseCase.call(SubscriptionParams(
            token: token, paymentMethod: 'card', plan: plan));

    subscription.fold(
      (Failure failure) {
        print("failure upgrade");
        return false;
      },
      (String name) {
        print('name');
        return true;
      },
    );
    return true;
  }

  Future<bool> cancelSubscription(String token, String name) async {
    bool res = false;
    Either<Failure, bool> subscription = await cancelSubscriptionUseCase
        .call(CancelParams(token: token, name: name));

    subscription.fold(
      (Failure failure) {},
      (bool subscription) {
        res = true;
      },
    );
    return res;
  }
}
