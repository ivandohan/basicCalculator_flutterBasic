import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color bgColor;
  final Color fgColor;
  IconData? icon;
  final String text;
  final Function() onTap;

  CalculatorButton({
    Key? key,
    required this.bgColor,
    required this.fgColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  CalculatorButton.icon({
    Key? key,
    required this.bgColor,
    required this.fgColor,
    this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bgColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: fgColor),
                )
              : Icon(
                  icon,
                  color: fgColor,
                ),
        ),
      ),
    );
  }
}
