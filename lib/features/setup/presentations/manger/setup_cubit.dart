import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(SetupInitialState());

  static SetupCubit get(BuildContext context) =>
      BlocProvider.of<SetupCubit>(context);

  static const int totalSteps = 4;
  int currentSteps = 0;
  final PageController controller = PageController();

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
    if (controller.hasClients) controller.jumpToPage(0);
    emit(SetupInitialState());
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}