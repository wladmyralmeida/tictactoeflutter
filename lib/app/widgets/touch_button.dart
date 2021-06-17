import 'package:flutter/material.dart';

class TouchButton {
  final id;
  String name;
  Color colorBackground;
  bool enabled;

  TouchButton(
      {this.id, this.name = "", this.colorBackground = Colors.grey, this.enabled = true});
}
