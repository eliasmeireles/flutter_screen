import 'package:flutter/material.dart';

extension ColorValidation on BuildContext {
  /// Return primary color from [Theme] of [BuildContext]
  /// if [color] is null
  Color defaultBackgroundColorOr(Color? color) =>
      color ?? Theme.of(this).colorScheme.background;

  /// Return primary color from [Theme] of [BuildContext]
  /// if [color] is null
  Color primaryColorOr(Color? color) => color ?? Theme.of(this).primaryColor;

  /// Return [ThemeData] of [BuildContext]
  ThemeData get theme => Theme.of(this);

  /// Return primary color from [Theme] of [BuildContext]
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Return [Size] of screen based on [BuildContext]
  Size screenSize() => MediaQuery.of(this).size;
}

extension ScreenNavigator on BuildContext {
  @optionalTypeArgs
  Future<T?> pushNamedRoute<T extends Object?>(String route, {T? arguments}) {
    return Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  @optionalTypeArgs
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  @optionalTypeArgs
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void removeRoute(Route<dynamic> route) {
    Navigator.of(this).removeRoute(route);
  }
}
