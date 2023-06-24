import 'package:flutter/material.dart';
import 'package:flutter_screen/src/screen/controllers/base_controller.dart';
import 'package:flutter_screen/src/widget/button/base_app_bar_button.dart';
import 'package:flutter_screen/src/widget/streaming_widget.dart';

class TitleAppBar extends StatelessWidget {
  final BaseController controller;
  final String hintText;
  final Widget defaultTitle;

  const TitleAppBar({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.defaultTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamingWidget<bool>(
      stream: controller.searchEnable,
      builder: (enable) {
        if (enable) {
          return TextFormField(
            controller: controller.searchController,
            onChanged: controller.onSearchTextChange,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: controller.disableSearchBar,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
        return defaultTitle;
      },
    );
  }
}

class IconSearchAppBar extends BaseAppBarButton {
  const IconSearchAppBar({
    Key? key,
    required BaseController controller,
  }) : super(key: key, controller: controller);

  @override
  Widget child(BuildContext context) {
    return IconButton(
      onPressed: controller.enableSearchBar,
      icon: const Icon(Icons.search),
    );
  }
}
