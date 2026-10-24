import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:rafeeqa/core/model/baby_model.dart';
import 'package:rafeeqa/core/services/hive_service.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  getIt.registerLazySingleton(
    () => HiveService(box: Hive.box<BabyModel>("babies")),
  );

  getIt.registerLazySingleton<SetupCubit>(() => SetupCubit());
}
