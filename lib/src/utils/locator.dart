import 'package:get_it/get_it.dart';
import 'package:scout_co/core/localization/generated/l10n.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => I10n());
}
