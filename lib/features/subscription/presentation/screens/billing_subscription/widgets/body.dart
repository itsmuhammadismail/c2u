part of '../billing_subscription_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;
  Future<void> fetchAllSubscriptions(String token) async {
    await context.read<SubscriptionCubit>().allSubscriptions(token);
  }

  Future<void> fetchCurrentSubscriptions(String token) async {
    await context.read<SubscriptionCubit>().currentSubscriptions(token);
  }

  void fetch(String token) async {
    print(token);
    await fetchAllSubscriptions(token);
    await fetchCurrentSubscriptions(token);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    String token = context.read<UserCubit>().state.user.token;
    fetch(token);
  }

  @override
  Widget build(BuildContext context) {
    List<Subscription> subscriptions =
        context.watch<SubscriptionCubit>().state.subscriptions;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Billing', style: kHeading2),
          const SizedBox(height: 40),
          isLoading
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
