import 'package:flutter/material.dart';

enum ButtonColor {
  black('#413e3d'),
  yellow('#e39123');

  final String hexValue;

  const ButtonColor(this.hexValue);

  Color get color {
    return Color(int.parse('0xFF${hexValue.substring(1)}'));
  }
}


class ButtonScreen extends StatelessWidget {
  final String button;
  final int span;
  final ButtonColor buttonColor;
  final VoidCallback onPressed;
  const ButtonScreen({super.key, required this.button, this.span = 1, required this.buttonColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: span,
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor.color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)

          )
        ),
        onPressed: onPressed, child: Text(button, style: const TextStyle(
        fontSize: 24
      ),),)
      ));
  }
}