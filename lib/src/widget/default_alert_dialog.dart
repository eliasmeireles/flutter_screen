import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen/src/style/parent_styles.dart';
import 'package:flutter_screen/src/style/txt_style.dart';

class DefaultAlertDialog extends StatefulWidget {
  final String message;
  final Widget child;
  final double width;
  final Widget? action;
  final Widget? plusWidget;
  final TxtStyle? textMessageStyle;
  final Color? background;

  const DefaultAlertDialog({
    Key? key,
    required this.message,
    required this.child,
    this.textMessageStyle,
    this.action,
    this.width = 255.0,
    this.background,
    this.plusWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DefaultAlertDialogState();
}

class _DefaultAlertDialogState extends State<DefaultAlertDialog>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var messageTextStyle = widget.textMessageStyle ?? textStyle.clone()
      ..fontSize(16);
    return Container(
      color: widget.background ?? Theme.of(context).cardColor,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -55,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                width: widget.width,
                child: Parent(
                  style: textInputParentStyle,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      widget.child,
                      Parent(
                        style: textInputParentStyle,
                        child: Txt(
                          widget.message,
                          style: messageTextStyle.clone()
                            ..textColor(Colors.grey[800]!),
                        ),
                      ),
                      Visibility(
                        visible: widget.plusWidget != null,
                        child: Parent(
                          style: defaultParentStyleI(),
                          child: widget.plusWidget,
                        ),
                      ),
                      Visibility(
                        visible: widget.action != null,
                        child: widget.action ?? const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
