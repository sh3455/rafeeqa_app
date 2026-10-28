// ignore_for_file: strict_top_level_inference, non_constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rafeeqa/core/model/baby_model.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/core/services/hive_service.dart';
import 'package:rafeeqa/core/services/image_picker_service.dart';
import 'package:rafeeqa/di/server_locator.dart';
import 'package:rafeeqa/features/setup/data/repo/vaccination_repo.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  final vaccinationRepo = getIt<VaccinationRepo>();
  final hiveService = getIt<HiveService>();

  SetupCubit() : super(SetupInitialState()) {
    getVaccinations();
  }

  static SetupCubit get(BuildContext context) =>
      BlocProvider.of<SetupCubit>(context);

  static const int totalSteps = 6;
  static const int totalPages = 7;
  int currentSteps = 0;
  static const int reviewPage = 4;
  static const int vaccinationPage = 2;
  static const int pastVaccinesPage = 3;
  static const int allSetPage = 5;
  String? selectedGender = 'Boy';
  String? typeOfBirth = 'Natural birth';
  int? selectedVaccineOption;
  DateTime? selectedBirthDate;
  List<VaccinationModel> vaccination = [];
  final Set<int> selectedVaccineIds = {};
  File? image;
  final service = ImagePickerService.instance;
  final PageController controller = PageController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  // Babies already saved in this setup session (their cards stay on screen).
  final List<BabyModel> savedBabies = [];
  bool _currentBabySaved = false;

  void changeStep(int step) {
    if (step < 0 || step >= totalSteps || step == currentSteps) return;
    if (step == reviewPage) enterReview();

    currentSteps = step;
    if (controller.hasClients) {
      controller.animateToPage(
        step,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(SetupChangeState());
  }

  void nextStep() {
    if (currentSteps == vaccinationPage) {
      _goFromVaccinationAnswer();
      return;
    }
    changeStep(currentSteps + 1);
  }

  void _goFromVaccinationAnswer() {
    switch (selectedVaccineOption) {
      case 0:
        selectedVaccineIds.addAll(vaccination.map((v) => v.id));
        changeStep(reviewPage);
      case 1:
        changeStep(pastVaccinesPage);
      case 2:
        selectedVaccineIds.clear();
        changeStep(allSetPage);
      default:
        debugPrint('no vaccine option selected');
    }
  }

  void previousStep() => changeStep(currentSteps - 1);

  void reset() {
    currentSteps = 0;
    selectedGender = 'Boy';
    savedBabies.clear();
    _currentBabySaved = false;
    if (controller.hasClients) controller.jumpToPage(0);
    emit(SetupInitialState());
  }

  @override
  Future<void> close() {
    controller.dispose();
    birthController.dispose();
    nameController.dispose();
    weightController.dispose();
    heightController.dispose();
    return super.close();
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      selectedBirthDate = date;
      birthController.text = DateFormat('MMM d, y').format(date);
    }
  }

  void selectGender(String gender) {
    selectedGender = gender;
    emit(SetupGenderChangedState(gender));
  }

  Future<void> pickerImage() async {
    final imagePick = await service.pickImageFromGallery();
    if (imagePick != null) {
      image = imagePick;
      emit(SetupImageChangedState());
    }
  }

  void selectTypeOfBirth(String type) {
    typeOfBirth = type;
    emit(SetupSelectTypeOfBirthState(type));
  }

  void selectVaccineOption(int index) {
    selectedVaccineOption = index;
    emit(SetupVaccineOptionChangedState(index));
  }

  bool get showStepper => currentSteps < reviewPage;

  Future<void> getVaccinations() async {
    emit(SetupVaccinationsLoadingState());
    final result = await vaccinationRepo.getVaccinationData();
    result.fold(
      (failure) =>
          emit(SetupVaccinationsFailureState(message: failure.message)),
      (vaccinations) {
        vaccination = vaccinations;
        emit(SetupVaccinationsSuccessState(vaccinations: vaccination));
      },
    );
  }

  bool get isAllVaccinesSelected =>
      vaccination.isNotEmpty && vaccination.length == selectedVaccineIds.length;

  void toggleVaccine(int id) {
    if (selectedVaccineIds.contains(id)) {
      selectedVaccineIds.remove(id);
    } else {
      selectedVaccineIds.add(id);
    }
    emit(SetupVaccineToggledState(List.of(selectedVaccineIds)));
  }

  void toggleSelectAllVaccines() {
    if (isAllVaccinesSelected) {
      selectedVaccineIds.clear();
    } else {
      selectedVaccineIds.addAll(vaccination.map((v) => v.id));
    }
    emit(SetupVaccineToggledState(List.of(selectedVaccineIds)));
  }

  String getVaccinationAgeTitle(double age) {
    if (age == 0) {
      return "At birth";
    } else {
      if (age == 1) {
        return "${age.toInt()} month";
      } else {
        return "${age.toInt()} months";
      }
    }
  }

  List<VaccinationModel> reviewList = [];

  void enterReview() {
    reviewList = vaccination
        .where((v) => selectedVaccineIds.contains(v.id))
        .toList();
  }

  Map<double, List<VaccinationModel>> get reviewGrouped {
    final map = <double, List<VaccinationModel>>{};
    for (final v in reviewList) {
      map.putIfAbsent(v.age, () => []).add(v);
    }
    final keys = map.keys.toList()..sort();
    return {for (final k in keys) k: map[k]!};
  }

  BabyModel? createBaby() {
    final birthDate = selectedBirthDate;
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (birthDate == null ||
        selectedGender == null ||
        typeOfBirth == null ||
        nameController.text.trim().isEmpty ||
        weight == null ||
        height == null) {
      return null;
    }

    return BabyModel.newBaby(
      name: nameController.text.trim(),
      dateOfBirth: birthDate,
      gender: selectedGender!,
      birthType: typeOfBirth!,
      weight: weight,
      height: height,
      image: image?.path,
      vaccinations: selectedVaccineIds.toList(),
    );
  }

  bool get isBoy => selectedGender == 'Boy';

  String ageText(DateTime birth) {
    final now = DateTime.now();
    int months = (now.year - birth.year) * 12 + now.month - birth.month;
    int days = now.day - birth.day;
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month, 0).day;
    }
    return '$months months, $days days';
  }

  /// Cards shown on the "All set" screen: saved babies, then the current one.
  List<BabyModel> get allBabies {
    final current = createBaby();
    return [...savedBabies, if (!_currentBabySaved && current != null) current];
  }

  /// Saves the current baby once and keeps it in [savedBabies].
  Future<bool> saveCurrentBaby() async {
    if (_currentBabySaved) return true;
    final baby = createBaby();
    if (baby == null) {
      debugPrint(
        'createBaby null -> name:${nameController.text} date:$selectedBirthDate '
        'w:${weightController.text} h:${heightController.text}',
      );
      return false;
    }
    try {
      await hiveService.saveData(baby);
    } catch (e) {
      debugPrint('save error: $e');
      return false;
    }
    savedBabies.add(baby);
    _currentBabySaved = true;
    return true;
  }

  /// Different birth date: everything starts empty.
  void startNewBaby() {
    nameController.clear();
    selectedBirthDate = null;
    selectedGender = 'Boy';
    image = null;
    selectedVaccineIds.clear();
    reviewList.clear();
    weightController.clear();
    heightController.clear();
    birthController.clear();
    typeOfBirth = 'Natural birth';
    selectedVaccineOption = null;
    _goToFirstStep();
  }

  /// Twin: keeps birth date, birth type and vaccines from the first baby.
  void startTwin() {
    nameController.clear();
    selectedGender = 'Boy';
    image = null;
    weightController.clear();
    heightController.clear();
    _goToFirstStep();
  }

  void _goToFirstStep() {
    _currentBabySaved = false;
    currentSteps = 0;
    if (controller.hasClients) controller.jumpToPage(0);
    emit(SetupChangeState());
  }

  void saveBaby() {}
}
