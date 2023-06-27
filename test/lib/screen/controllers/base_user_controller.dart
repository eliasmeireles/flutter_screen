import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_screen/flutter_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../di.dart';
import '../../intl_test_impl.dart';

class BaseUserScreenNavigatorTestImpl
    extends BaseScreenNavigator<IntlTestImpl> {
  @override
  Widget nextNavigate(RouteSettings settings, BaseController controller) {
    // TODO: implement nextNavigate
    throw UnimplementedError();
  }
}

class BaseUserCreateAccountControllerTestImpl
    extends BaseUserCreateAccountController<BaseUserScreenNavigatorTestImpl,
        IntlTestImpl> {
  @override
  Future<bool> canPopPage() => Future(() => true);
}

void main() {
  setUpAll(() {
    GetIt.instance.registerFactory<BaseUserScreenNavigatorTestImpl>(
        () => BaseUserScreenNavigatorTestImpl());
    setupDependencyInjection();
  });

  group('Base user controller validation', () {
    test(
      'must to return true when all controller values is valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, true);
      },
    );
    test(
      'must to return false when email is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "eliasgmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            false);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, false);
      },
    );

    test(
      'must to return false when username is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "elias@meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            false);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, false);
      },
    );

    test(
      'must to return false when password is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "1245";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), false);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, false);
      },
    );

    test(
      'must to return false when cellphone number is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            false);

        expect(controller.inputValidation, false);
      },
    );

    test(
      'must to return false when phone number is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "9999-9999";
        controller.cpfCnpjTextController.text = "38.746.629/0001-58";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            true);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            false);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, false);
      },
    );

    test(
      'must to return false when CPF or CNPJ is not valid',
      () {
        final controller = BaseUserCreateAccountControllerTestImpl();
        controller.usernameTextController.text = "Elias Meireles";
        controller.emailTextController.text = "elias@gmail.com";
        controller.passwordTextController.text = "@fgfft#157";
        controller.cellphoneTextController.text = "31 99999-9999";
        controller.phoneTextController.text = "31 9999-9999";
        controller.cpfCnpjTextController.text = "746.629.00-01";

        expect(controller.passwordTextController.isValid(min: 6), true);
        expect(
            controller.emailTextController.isValidByWithPatternOf(emailPattern),
            true);
        expect(
            controller.cpfCnpjTextController
                .isValidByWithPatternOf(cpfCnpjPattern),
            false);
        expect(
            controller.usernameTextController
                .isValidByWithPatternOf(usernamePattern),
            true);
        expect(
            controller.phoneTextController
                .isValidByWithPatternOf(phoneNumberPattern),
            true);
        expect(
            controller.cellphoneTextController
                .isValidByWithPatternOf(cellphoneNumberPattern),
            true);

        expect(controller.inputValidation, false);
      },
    );
  });
}
