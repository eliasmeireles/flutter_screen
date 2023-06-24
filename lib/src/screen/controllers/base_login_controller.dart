import 'package:flutter/material.dart';
import 'package:flutter_screen/src/intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_screen/flutter_screen.dart';

abstract class BaseLoginController<T extends BaseScreenNavigator,
    INTL extends Intl> extends BaseController<T, INTL> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  final isObscuredText = BehaviorSubject<bool>.seeded(true);
  final isInputValid = BehaviorSubject<bool>.seeded(false);

  void onObscuredTextChange() => isObscuredText.value = !isObscuredText.value;

  bool get inputValidation =>
      emailPattern.hasMatch((emailTextController.text.trim())) &&
      passwordTextController.text.trim().length >= 6;

  void onStateChange() => isInputValid.value = inputValidation;

  void login();

  void loginSuccessful() {
    clear();
    isLoggedIn.value = true;
  }

  void clear() {
    emailTextController.clear();
    passwordTextController.clear();
  }

  @override
  @mustCallSuper
  doLogout() {
    clear();
    isLoggedIn.value = false;
    screenNavigator.pushReplacementNamed(loginPath);
  }
}
