// ignore_for_file: override_on_non_overriding_member

abstract class SetupState {}

class SetupInitialState extends SetupState{}

class SetupChangeState extends SetupState{}

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