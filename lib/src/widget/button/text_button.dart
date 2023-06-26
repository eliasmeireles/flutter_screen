import 'package:flutter/material.dart';
import 'package:flutter_screen/flutter_screen.dart';

class BaseTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final Function onPressed;

  const BaseTextButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.buttonStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle ??
          ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                color: ThemeData.light().textTheme.titleLarge?.color)),
          ),
      onPressed: () => onPressed,
      child: Text(
        text,
        style: textStyle ?? context.theme.textTheme.titleMedium,
      ),
    );
  }
}
