part of '../notification_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;

  void fetchNotifications() async {
    String token = context.read<UserCubit>().state.user.token;
    int id = context.read<UserCubit>().state.user.id;
    await context.read<NotificationCubit>().getNotifications(token, id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    List<NotificationEntity> notifications =
        context.watch<NotificationCubit>().state.notifications;
    return Padding(
      padding: EdgeInsets.all(20),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                            assignId: notifications[index].userId,
                            title: notifications[index].name)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NotificationCard(notification: notifications[index]),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 231, 231, 231)),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
