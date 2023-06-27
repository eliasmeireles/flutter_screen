import 'package:flutter/material.dart';
import 'package:flutter_screen/src/intl/intl.dart';

class IntlTestImpl extends Intl {
  @override
  String get appName => "Test";

  @override
  String get reorderItemUp => 'Move up';

  @override
  String get reorderItemDown => 'Move down';

  @override
  String get reorderItemLeft => 'Move left';

  @override
  String get reorderItemRight => 'Move right';

  @override
  String get reorderItemToEnd => 'Move to the end';

  @override
  String get reorderItemToStart => 'Move to the start';

  @override
  TextDirection get textDirection => TextDirection.ltr;
}
