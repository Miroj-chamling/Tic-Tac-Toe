import 'package:flutter/material.dart';
import 'package:mytiktaktoe/constants.dart';

class SelectOptions extends StatelessWidget {
  String option;
  VoidCallback onPressed;
  SelectOptions({required this.option, required this.onPressed});
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size, size),
        primary: kContainerCardColor,
      ),
      onPressed: onPressed,
      child: Text(
        option,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 72,
        ),
      ),
    );
  }
}
