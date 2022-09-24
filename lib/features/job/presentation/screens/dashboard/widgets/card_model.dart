import 'package:flutter/material.dart';

class CardModel {
  final String name, icon;
  final int? value;
  final Color color;

  CardModel({
    required this.name,
    required this.value,
    required this.icon,
    required this.color,
  });
}
