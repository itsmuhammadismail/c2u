import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class FindSubbieScreen extends StatelessWidget {
  const FindSubbieScreen({super.key});

  static String id = "find_subbie_screen";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Find Subbie',
      body: Body(),
    );
  }
}
