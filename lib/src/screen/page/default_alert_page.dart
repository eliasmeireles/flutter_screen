import 'package:flutter/material.dart';
import 'package:flutter_screen/src/style/txt_style.dart';
import 'package:flutter_screen/src/util/assets_util.dart';
import 'package:flutter_screen/src/widget/button/default_rise_button.dart';
import 'package:flutter_screen/src/widget/button/rise_button_child_widget.dart';
import 'package:flutter_screen/src/widget/default_alert_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAlertPage extends StatelessWidget {
  final String message;
  final String? asset;
  final String? textButton;
  final IconData iconButton;
  final Function onTap;

  const DefaultAlertPage({
    Key? key,
    required this.message,
    required this.onTap,
    this.asset,
    this.textButton,
    this.iconButton = Icons.exit_to_app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAlertDialog(
      message: message,
      textMessageStyle: textStyleDefaultPadding
        ..clone()
        ..textColor(Colors.white),
      action: DefaultRiseButton(
        enable: true,
        onTap: () => onTap.call(),
        child: RiseButtonChildWidget(
          enable: true,
          text: textButton ?? "",
          iconData: iconButton,
        ),
      ),
      child: SvgPicture.asset(
        asset ??
            AssetsUtil.loadScreenViewSvgAlert("undraw_server_down_s4lk_error"),
        width: 155,
        height: 155,
      ),
    );
  }
}
