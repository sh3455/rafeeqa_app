import 'package:dartz/dartz.dart';
import 'package:rafeeqa/core/errors/failure.dart';
import 'package:rafeeqa/core/errors/hive_failure.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/features/setup/data/datasource/vaccination_data_source.dart';
import 'package:rafeeqa/features/setup/data/repo/vaccination_repo.dart';

class VaccinationRepoImpl extends VaccinationRepo {
  final VaccinationDataSource vaccinationDataSource;
  VaccinationRepoImpl(this.vaccinationDataSource);

  @override
  Future<Either<Failure, List<VaccinationModel>>> getVaccinationData() async {
    try {
      final vaccination = await vaccinationDataSource.getVaccinationData();
      return Right(vaccination);
    } catch (e) {
      return Left(LocalSetUpFailure.unknown());
    }
  }
}
