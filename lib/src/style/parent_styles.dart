import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen/src/constants/dimension.dart';

ParentStyle defaultParentStyle(Size size) {
  double width = size.width;
  double height = size.height;

  double maxScreenWidth = width > 355 ? 355 : width;

  return ParentStyle()
    ..padding(top: DEFAULT_PADDING)
    ..alignmentContent.center(true)
    ..alignment.center(true)
    ..width(maxScreenWidth);
}

ParentStyle defaultParentStyleI() {
  return ParentStyle()
    ..padding(left: DEFAULT_PADDING, right: DEFAULT_PADDING)
    ..alignmentContent.center(true)
    ..alignment.center(true)
    ..width(415);
}

ParentStyle defaultParentFormFieldStyle(Size size) {
  double width = size.width;
  double height = size.height;

  double maxScreenWidth = width > 355 ? 355 : width;

  return ParentStyle()
    ..padding(
        left: DEFAULT_PADDING, right: DEFAULT_PADDING, top: DEFAULT_PADDING)
    ..alignmentContent.center(true)
    ..alignment.center(true)
    ..width(maxScreenWidth);
}
