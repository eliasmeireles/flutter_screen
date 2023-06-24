import 'package:flutter/material.dart';
import 'package:flutter_screen/flutter_screen.dart';

class LogoutButton extends BaseAppBarButton {
  const LogoutButton({super.key, required super.controller});

  @override
  Widget child(BuildContext context) {
    return StreamingWidget(
      stream: controller.isLoggedIn,
      builder: (isLoggedIn) {
        return Visibility(
          visible: isLoggedIn,
          child: IconButton(
            onPressed: controller.logoutRequest,
            icon: const Icon(Icons.logout),
          ),
        );
      },
    );
  }
}
