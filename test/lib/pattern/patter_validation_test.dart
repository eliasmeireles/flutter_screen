import 'package:flutter_screen/src/util/pattern_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email pattern validation', () {
    test(
      'must to return true when email is valid',
      () {
        var expectedValidation = isEmailValid("elias@gmail.com");

        expect(expectedValidation, true);
      },
    );

    test(
      'must to return false when email is not valid',
      () {
        var expectedValidation = isEmailValid("elias-email.com");

        expect(false, expectedValidation);
      },
    );
  });

  group('Username pattern validation', () {
    test(
      'must to return true when username is valid',
      () {
        var expectedValidation = isUsernameValid("Elias Meireles");

        expect(expectedValidation, true);
      },
    );

    test(
      'must to return false when username is not valid',
      () {
        var expectedValidation = isUsernameValid("elias Meireles");

        expect(false, expectedValidation);
      },
    );
  });

  group('Phone number pattern validation', () {
    test(
      'must to return true when phone number is valid',
      () {
        var expectedValidation = isPhoneNumberValid("31 3555-8546");

        expect(true, expectedValidation);
      },
    );

    test(
      'must to return false when phone number is not valid',
      () {
        var expectedValidation = isPhoneNumberValid("31 35559-8546");

        expect(false, expectedValidation);
      },
    );

    test(
      'must to return true when cellphone number is valid',
      () {
        var expectedValidation = isCellphoneNumberValid("31 98567-8546");

        expect(true, expectedValidation);
      },
    );

    test(
      'must to return false when cellphone number is not valid',
      () {
        var expectedValidation = isCellphoneNumberValid("31 8567-8546");

        expect(false, expectedValidation);
      },
    );
  });

  group('CPF/CNPJ validation', () {
    test('must to return true when CPF is valid', () {
      var expectedValidation = isCpfCnpjValid('716.094.810-62');

      expect(true, expectedValidation);
    });

    test('must to return true when CNPJ is valid', () {
      var expectedValidation = isCpfCnpjValid('38.746.629/0001-58');

      expect(true, expectedValidation);
    });

    test('must to return false when CPF is not valid', () {
      expect(false, isCpfCnpjValid('111094.810-62'));
      expect(false, isCpfCnpjValid('11109481062'));
    });

    test('must to return false when CNPJ is not valid', () {
      expect(false, isCpfCnpjValid('38.746.629/0001-5'));
      expect(false, isCpfCnpjValid('38.746.6290001-58'));
    });
  });
}
