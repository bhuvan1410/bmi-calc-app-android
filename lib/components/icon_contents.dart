import 'package:flutter/material.dart';
import 'package:bhuvan_bmi_calc/constants.dart';

class iconContents extends StatelessWidget {
  final IconData icon;
  final String label;
  iconContents({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
