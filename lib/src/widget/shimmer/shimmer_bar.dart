import 'package:flutter/material.dart';
import 'package:flutter_screen/src/constants/dimension.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBar extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerBar({
    Key? key,
    this.height = 22.0,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: DEFAULT_PADDING,
        right: DEFAULT_PADDING,
        top: EIGHT_PADDING,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: Colors.grey.shade400,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
