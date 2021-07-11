import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart';

class MyButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const MyButton({
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: kTextColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
