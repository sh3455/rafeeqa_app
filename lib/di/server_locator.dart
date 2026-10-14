import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:rafeeqa/core/model/baby_model.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/core/services/hive_service.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

   getIt.registerLazySingleton<HiveService<BabyModel>>(
    () => HiveService<BabyModel>(box: Hive.box<BabyModel>('babies')),
  );

  getIt.registerLazySingleton<HiveService<VaccinationModel>>(
    () => HiveService<VaccinationModel>(box: Hive.box<VaccinationModel>('vaccinations')),
  );
}