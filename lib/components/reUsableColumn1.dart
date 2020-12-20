import 'package:flutter/material.dart';
class ReUsableColumn extends StatelessWidget {
  ReUsableColumn({this.text, this.icon});
  final Widget text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [icon, SizedBox(height: 15.0), text],
    );
  }
}
