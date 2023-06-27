import 'package:flutter_screen/flutter_screen.dart';

abstract class ApplicationResponse {
  bool unexpectedError;
  bool isInternetConnected;
  int? code;
  bool success;
  String message;
  int timestamp;
  bool unverifiedAccount;
  Map<String, Object>? info;

  ApplicationResponse({
    this.success = false,
    this.unexpectedError = false,
    this.isInternetConnected = false,
    this.code,
    required this.message,
    required this.timestamp,
    this.info,
    this.unverifiedAccount = true,
  });

  AlertResource errorResource(Intl i18n);
}
