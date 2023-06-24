import 'package:division/division.dart';
import 'package:flutter/material.dart';

final ParentStyle textInputParentStyle = ParentStyle()
  ..alignment.center()
  ..padding(top: 12);

final TxtStyle textStyle = TxtStyle()
  ..alignment.center()
  ..textAlign.center()
  ..fontSize(16);

final TxtStyle textStyleWhite = TxtStyle()
  ..alignment.center()
  ..textColor(Colors.white)
  ..textAlign.center()
  ..fontSize(14);

final TxtStyle appBarTxtStyleWhiteColor = TxtStyle()..textColor(Colors.white);

final TxtStyle textStyleDefaultPadding = TxtStyle()
  ..textAlign.left()
  ..textColor(Colors.black)
  ..fontSize(16);

final TxtStyle middleTxtStyleCard = TxtStyle().clone()
  ..textColor(Colors.grey[500]!)
//  ..fontWeight(FontWeight.values[500])
  ..margin(top: 2)
  ..fontSize(12);

final TxtStyle commentTextStyle = TxtStyle()
  ..textColor(Colors.black87)
  ..textAlign.justify(true)
  ..fontWeight(FontWeight.values[4])
  ..fontSize(14);
