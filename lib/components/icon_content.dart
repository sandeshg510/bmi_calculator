import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContet extends StatelessWidget {
  const IconContet({this.planets, this.label});
  final IconData? planets;
  final dynamic label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          planets,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabeltextStyle,
        )
      ],
    );
  }
}
