import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';

class SetupBabySteps extends StatelessWidget {
  const SetupBabySteps({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);

    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: List.generate(SetupCubit.totalSteps * 2 - 1, (index) {
              if (index.isEven) {
                final stepIndex = index ~/ 2;
                return _StepCircle(
                  number: stepIndex + 1,
                  isActive: stepIndex <= cubit.currentSteps,
                  isCurrent: stepIndex == cubit.currentSteps,
                  onTap: () => cubit.changeStep(stepIndex),
                );
              }
              return _StepLine(isActive: (index ~/ 2) < cubit.currentSteps);
            }),
          ),
        );
      },
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({
    required this.number,
    required this.isActive,
    required this.isCurrent,
    required this.onTap,
  });

  final int number;
  final bool isActive;
  final bool isCurrent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppTheme.primary : Colors.grey,
          border: isCurrent
              ? Border.all(color: AppTheme.primary, width: 3)
              : null,
        ),
        child: Center(
          child: CustomText(
            text: "$number",
            size: 16,
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }
}

class _StepLine extends StatelessWidget {
  const _StepLine({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2.h,
        color: isActive ? AppTheme.primary : Colors.grey,
      ),
    );
  }
}