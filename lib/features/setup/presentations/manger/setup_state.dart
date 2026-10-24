// ignore_for_file: override_on_non_overriding_member

import 'package:rafeeqa/core/model/vaccination_model.dart';

abstract class SetupState {}

class SetupInitialState extends SetupState {}

class SetupChangeState extends SetupState {}

class SetupGenderChangedState extends SetupState {
  final String gender;
  SetupGenderChangedState(this.gender);
  @override
  List<Object?> get props => [gender];
}

class SetupImageChangedState extends SetupState {}

class SetupSelectTypeOfBirthState extends SetupState {
  final String typeOfBirth;
  SetupSelectTypeOfBirthState(this.typeOfBirth);

  @override
  List<Object?> get props => [typeOfBirth];
}

class SetupVaccineOptionChangedState extends SetupState {
  final int index;
  SetupVaccineOptionChangedState(this.index);

  @override
  List<Object?> get props => [index];
}

class SetupVaccinationsLoadingState extends SetupState {}

class SetupVaccinationsSuccessState extends SetupState {
  final List<VaccinationModel> vaccinations;

  SetupVaccinationsSuccessState({required this.vaccinations});
}

class SetupVaccinationsFailureState extends SetupState {
  final String message;

  SetupVaccinationsFailureState({required this.message});
}
