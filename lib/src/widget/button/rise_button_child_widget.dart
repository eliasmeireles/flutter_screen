import 'package:flutter/material.dart';

class RiseButtonChildWidget extends StatelessWidget {
  final bool enable;
  final String text;
  final IconData iconData;

  const RiseButtonChildWidget({
    Key? key,
    required this.text,
    required this.iconData,
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
          style: TextStyle(color: enable ? Colors.white : Colors.grey),
        ),
        const SizedBox(width: 5),
        Icon(iconData, color: enable ? Colors.white : Colors.grey)
      ],
    );
  }
}
