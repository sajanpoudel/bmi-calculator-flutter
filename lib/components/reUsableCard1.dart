import 'package:flutter/material.dart';
class ReUsableCard extends StatelessWidget {
  ReUsableCard({@required this.color, this.cardChild,this.onTapGesture});
  final Color color;
  final Widget cardChild;
  final Function onTapGesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTapGesture,
          child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
