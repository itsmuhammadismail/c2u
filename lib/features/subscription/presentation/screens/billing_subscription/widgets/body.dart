part of '../billing_subscription_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<Subscription> subscriptions =
        context.watch<SubscriptionCubit>().state.subscriptions;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Billing & Subscriptions', style: kHeading2),
          const SizedBox(height: 40),
          context.watch<SubscriptionCubit>().state.status ==
                  SubscriptionStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subscriptions.length,
                  itemBuilder: (context, index) {
                    if (subscriptions[index].userType ==
                        context.read<UserCubit>().state.user.type) {
                      return SubscriptionCard(
                        subscription: subscriptions[index],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
        ],
      ),
    );
  }
}
