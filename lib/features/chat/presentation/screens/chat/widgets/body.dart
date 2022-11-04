part of '../chat_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Message(
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
            ),
            SizedBox(height: 20),
            Message(
              isMe: true,
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
