import 'package:dartz/dartz.dart';
import 'package:rafeeqa/const/vaccinations.dart';
import 'package:rafeeqa/core/errors/failure.dart';
import 'package:rafeeqa/core/errors/hive_failure.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/features/setup/data/datasource/vaccination_data_source.dart';
import 'package:rafeeqa/features/setup/data/repo/vaccination_repo.dart';

class VaccinationRepoImpl extends VaccinationRepo {
  final VaccinationDataSource vaccinationDataSource;
  VaccinationRepoImpl(this.vaccinationDataSource);

  @override
  Future<Either<Failure, List<VaccinationModel>>> getVaccinationData(
    String langCode,
  ) async {
   try {
    final list = langCode == 'ar' ? vaccinationsAr : vaccinationsEn;
    return Right(list);
    } catch (e) {
      return Left(LocalSetUpFailure.unknown());
    }
  }

}
