import 'package:flutter/material.dart';
import 'package:flutter_screen/flutter_screen.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseUserCreateAccountController<T extends BaseScreenNavigator,
    INTL extends Intl> extends BaseController<T, INTL> {
  final usernameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final cellphoneTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final cpfCnpjTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final isObscuredText = BehaviorSubject<bool>.seeded(true);
  final isInputValid = BehaviorSubject<bool>.seeded(false);

  final cpfCnpjMaskFormatter =
      TextInputMask(mask: [cpfMask, cnpjMask], reverse: true);
  final phoneNumberMaskFormatter =
      TextInputMask(mask: [cellphoneMask, phoneMask]);

  void onObscuredTextChange() => isObscuredText.value = !isObscuredText.value;

  bool get inputValidation =>
      usernameTextController.isValidByWithPatternOf(usernamePattern) &&
      cellphoneTextController.isValidByWithPatternOf(cellphoneNumberPattern) &&
      phoneTextController.isValidByWithPatternOf(phoneNumberPattern) &&
      cpfCnpjTextController.isValidByWithPatternOf(cpfCnpjPattern) &&
      emailTextController.isValidByWithPatternOf(emailPattern) &&
      passwordTextController.isValid(min: 6);

  void onStateChange() => isInputValid.value = inputValidation;

  @override
  void dispose() {
    isObscuredText.close();
    isInputValid.close();
    super.dispose();
  }
}
