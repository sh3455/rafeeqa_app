import 'package:get_it/get_it.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}