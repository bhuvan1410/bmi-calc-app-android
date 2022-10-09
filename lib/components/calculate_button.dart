import 'package:flutter/material.dart';
import 'package:bhuvan_bmi_calc/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: largeButtonTextStyle),
        ),
        color: Color(bottomColor),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
