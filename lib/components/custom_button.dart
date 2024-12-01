import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.backgroundColor,
    this.forgroundColor, {
    super.key,
    required this.text,
    required this.function,
  });

  final String text;
  final Color backgroundColor;
  final Color forgroundColor;
  final void Function() function;

  @override
  Widget build(context) {
    return SizedBox(
      width: 360,
      child: ElevatedButton(
        onPressed: function,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: forgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
