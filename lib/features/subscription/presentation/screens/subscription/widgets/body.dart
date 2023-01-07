part of '../subscription_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;

  void fetchAllSubscriptions() async {
    String token = context.read<UserCubit>().state.user.token;
    await context.read<SubscriptionCubit>().allSubscriptions(token);
    await context.read<SubscriptionCubit>().currentSubscriptions(token);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    List<Subscription> subscriptions =
        context.watch<SubscriptionCubit>().state.subscriptions;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Current Subscription',
                  style: kHeading2,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      buildRow([
                        'SUBSCRIPTION',
                        'STATUS',
                        'NEXT BILLING DATE',
                        'STARTED',
                        'ACTION'
                      ]),
                      ...subscriptions
                          .where((subscription) =>
                              subscription.isActive &&
                              subscription.userType ==
                                  context.read<UserCubit>().state.user.type)
                          .map((subscription) => TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(subscription.name),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        subscription.status.capitalize(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        subscription.nextBillingDate ?? '-'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:
                                        Text(subscription.startedDate ?? '-'),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        setState((() => isLoading = true));
                                        String token = context
                                            .read<UserCubit>()
                                            .state
                                            .user
                                            .token;
                                        bool res = await context
                                            .read<SubscriptionCubit>()
                                            .cancelSubscription(
                                                token, subscription.name);
                                        String message =
                                            "Subscription not canceled";
                                        if (res) {
                                          message =
                                              "Subscription has been canceled successfully";
                                        }
                                        var snackBar = SnackBar(
                                          content: Text(message),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        fetchAllSubscriptions();
                                      },
                                      child: Text('Cancel')),
                                ],
                              ))
                          .toList()
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'All Subscriptions',
                  style: kHeading2,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      buildRow([
                        'SUBSCRIPTION',
                        'STATUS',
                        'DURATION',
                        'TRIAL END DATE',
                        'END DATE'
                      ]),
                      ...subscriptions
                          .where((subscription) =>
                              subscription.userType ==
                              context.read<UserCubit>().state.user.type)
                          .map((subscription) => TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(subscription.name),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        subscription.status.capitalize(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        '${subscription.duration} ${subscription.durationType}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:
                                        Text(subscription.trialEndsAt ?? '-'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(subscription.endsAt ?? '-'),
                                  ),
                                ],
                              ))
                          .toList()
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  cell,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ))
          .toList());
}
