import 'package:flutter/material.dart';
import 'package:flutter_screen/flutter_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseController<T extends BaseScreenNavigator, INTL extends Intl> {
  final argument = BehaviorSubject<Object?>();
  final INTL intl = GetIt.instance.get();
  final T screenNavigator = GetIt.instance.get<T>();
  final searchEnable = BehaviorSubject<bool>.seeded(false);
  final isLoggedIn = BehaviorSubject<bool>.seeded(false);

  final TextEditingController searchController = TextEditingController();

  final logger = Logger();

  void enableSearchBar() => searchEnable.value = true;

  void loadArg(Object? arg) {
    argument.value = arg;
    onArgumentReceived(arg);
  }

  ARG getArgument<ARG>() {
    throwIf(!argument.hasValue || argument.value == null,
        "Argument not present at this context!");
    return argument.value as ARG;
  }

  @mustCallSuper
  void init() {
    logger.log(Level.debug, "$runtimeType -> initialized");
  }

  void onArgumentReceived(Object? arg) {}

  /// Return true when search bar is enable
  ///
  /// If [searchController.text] is not empty, then just clear the text
  bool disableSearchBar() {
    if (searchController.text.trim().isNotEmpty) {
      searchController.clear();
      return true;
    } else {
      searchEnable.value = false;
    }
    return false;
  }

  void onSearchTextChange(String text) {}

  Future<bool> canPopPage();

  C cast<C extends BaseController>() => this as C;

  void onLoadHome() {}

  @mustCallSuper
  void userDidLogout() {}

  @mustCallSuper
  void userDidLogin() {}

  @mustCallSuper
  void dispose() {
    searchEnable.close();
    searchController.dispose();
    logger.log(Level.debug, "$runtimeType -> was disposed.");
    isLoggedIn.close();
    argument.close();
  }

  void logoutRequest() {
    if (screenNavigator.currentPage != logoutPath) {
      screenNavigator.push(logoutPath);
    }
  }

  void logoutRequestCancel() {
    if (screenNavigator.currentPage != logoutPath) {
      screenNavigator.push(logoutPath);
    }
  }

  doLogout() {}
}
