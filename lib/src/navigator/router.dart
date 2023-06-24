import 'package:flutter/material.dart';

typedef ScreenViewWidgetBuilder = Widget Function(BuildContext context);

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class ScreenViewRouter {
  static final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();

  static String initialRoute = 'companies-screen';
  static String login = 'login-screen';
  static String userProfile = 'user-profile-screen';
  static String userProfileUpdateScreen = 'user-profile-update-screen';
  static String newAccountScreen = 'new-account-screen';

  ScreenViewRouter.__();

  static Map<String, Widget> screens = <String, Widget>{};

  static void addPage(String path, Widget widget) {
    screens.putIfAbsent(path, () => widget);
  }

  static PageRouteBuilder onGenerateRoute(settings) {
    Widget? screen = ScreenViewRouter.screens[settings.name];
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => screen!,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  static void popScreen() {
    if (globalNavigatorKey.currentContext != null) {
      Navigator.pop(globalNavigatorKey.currentContext!);
    }
  }

  static void pushNamedRoute({
    required BuildContext context,
    required String routeName,
    dynamic argument,
  }) {
    Widget? screen = screens[routeName];
    Navigator.push(
      context,
      SlideRightRoute(widget: screen!),
    );
  }
}
