import 'package:flutter/material.dart';
import 'constant.dart';


class BottomButton extends StatelessWidget {
final String buttonTitle;
final Function onTap;
BottomButton({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 12.0),
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        height: kBottomContainerHeight,
        child: Center(
          
          child: Text(buttonTitle, style: kLargeButtonTextStyle),
        ),
      ),
    );
  }
}
