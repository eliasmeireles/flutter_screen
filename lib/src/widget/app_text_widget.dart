import 'package:division/division.dart';
import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String? text;
  final TxtStyle? textStyle;
  final EdgeInsets? padding;
  final Color color;

  const AppTextWidget({
    Key? key,
    required this.text,
    this.textStyle,
    this.padding,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: text != null && text!.isNotEmpty,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0.0),
        child: Txt(
          text!,
          style: textStyle,
        ),
      ),
    );
  }
}
