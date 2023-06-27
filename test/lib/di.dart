import 'package:flutter_screen/src/intl/intl.dart';
import 'package:get_it/get_it.dart';

import 'intl_test_impl.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  GetIt.instance.registerSingleton<Intl>(IntlTestImpl());
}
