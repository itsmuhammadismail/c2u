import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class SubbieDetailScreen extends StatelessWidget {
  final int subbieId;

  static String id = "subbie_detail_screen";

  const SubbieDetailScreen({super.key, required this.subbieId});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Subbie Detail',
      back: true,
      body: Body(),
    );
  }
}
