import 'package:flutter/material.dart';
import 'package:flutter_screen/src/screen/controllers/base_controller.dart';
import 'package:flutter_screen/src/widget/streaming_widget.dart';

abstract class BaseAppBarButton extends StatelessWidget {
  final BaseController controller;

  const BaseAppBarButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget child(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return StreamingWidget<bool>(
      stream: controller.searchEnable,
      builder: (search) {
        return Visibility(
          visible: !search,
          child: child(context),
        );
      },
    );
  }
}
