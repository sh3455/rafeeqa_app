import 'package:dartz/dartz.dart';
import 'package:rafeeqa/core/errors/failure.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';

abstract class VaccinationRepo {
  Future<Either<Failure, List<VaccinationModel>>> getVaccinationData();
}
