import 'package:flutter/material.dart';

class RiseButtonChildWidget extends StatelessWidget {
  final bool enable;
  final String text;
  final Color? enableIconColor;
  final Color? disableIconColor;
  final Color? enableTextColor;
  final Color? disableTextColor;
  final IconData iconData;

  const RiseButtonChildWidget({
    Key? key,
    required this.text,
    required this.iconData,
    this.enableTextColor = Colors.white,
    this.disableTextColor = Colors.white,
    this.enableIconColor = Colors.white,
    this.disableIconColor = Colors.white,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.toUpperCase(),
          style: TextStyle(color: enable ? enableTextColor : disableTextColor),
        ),
        const SizedBox(width: 5),
        Icon(iconData, color: enable ? enableIconColor : disableIconColor)
      ],
    );
  }
}
