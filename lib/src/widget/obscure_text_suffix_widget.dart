import 'package:flutter/material.dart';
import 'package:flutter_screen/src/extensions/build_context.dart';

class ObscureTextSuffixWidget extends StatelessWidget {
  final Function onTap;
  final bool visibility;
  final Color? color;

  const ObscureTextSuffixWidget({
    Key? key,
    required this.onTap,
    this.visibility = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        visibility ? Icons.visibility_off : Icons.visibility,
        color: color ?? context.primaryColor,
        size: 20,
      ),
      onTap: () => onTap.call(),
    );
  }
}
