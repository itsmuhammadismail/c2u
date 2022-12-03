part of '../find_subbie_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      
      children: [
        buildRow(['Subbie', 'Actions']),
      ],
    );
  }

  TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cell,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList());
}
