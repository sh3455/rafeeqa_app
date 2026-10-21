// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rafeeqa/core/services/image_picker_service.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(SetupInitialState());

  static SetupCubit get(BuildContext context) =>
      BlocProvider.of<SetupCubit>(context);

  static const int totalSteps = 4;
  int currentSteps = 0;
  String? selectedGender = 'Boy';
  String? typeOfBirth = 'Natural birth';
  File? image;
  final service = ImagePickerService.instance;
  final PageController controller = PageController();
  final TextEditingController textEditingController = TextEditingController();

  void changeStep(int step) {
    if (step < 0 || step >= totalSteps || step == currentSteps) return;
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

  void nextStep() => changeStep(currentSteps + 1);

  void previousStep() => changeStep(currentSteps - 1);

  void reset() {
    currentSteps = 0;
    selectedGender = 'Boy';
    if (controller.hasClients) controller.jumpToPage(0);
    emit(SetupInitialState());
  }

  @override
  Future<void> close() {
    controller.dispose();
    textEditingController.dispose();
    return super.close();
  }

Future<void> pickDate(BuildContext context) async{
  final date = await showDatePicker(
    context: context,
    firstDate: DateTime(1960),
    lastDate: DateTime.now(),
    initialDate: DateTime.now()
    );
    if (date != null){
      textEditingController.text = DateFormat('MMM d, y').format(date); 
    }
 
}

void selectGender(String gender){
  selectedGender = gender;
  emit(SetupGenderChangedState(gender));
}

Future <void> pickerImage() async{
 final imagePick = await service.pickImageFromGallery();
 if (imagePick != null){
    image = imagePick;
     emit(SetupImageChangedState());
 }

}

void selectTypeOfBirth(String type) {
  typeOfBirth = type;
  emit(SetupSelectTypeOfBirthState(type));
}

}