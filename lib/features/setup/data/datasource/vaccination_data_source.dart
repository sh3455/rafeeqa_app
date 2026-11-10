import 'package:rafeeqa/const/vaccinations.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';

class VaccinationDataSource {
  final SettingsCubit settingsCubit;

  VaccinationDataSource({required this.settingsCubit});

  Future<List<VaccinationModel>> getVaccinationData() async {
    var lang = settingsCubit.state.lang;
    return lang == "ar" ? vaccinationsAr : vaccinationsEn;
  }
}
