import 'package:c2u/shared/layout/main_layout/widgets/app_bar.dart';
import 'package:c2u/shared/layout/main_layout/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final bool back;
  final Widget body;

  const MainLayout({super.key, required this.title, required this.body, this.back = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: title, back: back),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(child: body),
    );
  }
}
