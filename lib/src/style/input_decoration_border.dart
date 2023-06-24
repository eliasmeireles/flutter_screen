import 'package:flutter/material.dart';
import 'package:flutter_screen/src/constants/dimension.dart';

OutlineInputBorder buildOutlineInputBorder(Color accentColor) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: accentColor, width: 1.0),
    borderRadius:
        const BorderRadius.all(Radius.circular(DEFAULT_CIRCLE_BORDER)),
  );
}

OutlineInputBorder customOutlineInputBorder(Color accentColor, double width) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: accentColor, width: width),
    borderRadius:
        const BorderRadius.all(Radius.circular(DEFAULT_CIRCLE_BORDER)),
  );
}
