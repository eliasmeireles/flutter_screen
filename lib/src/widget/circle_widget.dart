import 'package:flutter/material.dart';

class CircleBorderedWidget extends StatelessWidget {
  final double size;
  final Widget child;
  final Color borderColor;
  final double borderCircle;
  final double borderWidth;

  const CircleBorderedWidget({
    Key? key,
    required this.child,
    this.size = 150,
    this.borderCircle = 100,
    this.borderColor = Colors.white,
    this.borderWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderCircle),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        elevation: 0.0005,
        child: child,
      ),
    );
  }
}
