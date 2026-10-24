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
    var cubit = SetupCubit.get(context);
    return BlocConsumer<SetupCubit, SetupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              children: List.generate(SetupCubit.totalSteps * 2 - 1, (index) {
                if (index % 2 == 0) {
                  int stepIndex = index ~/ 2;
                  bool isActive = stepIndex <= cubit.currentSteps;
                  return GestureDetector(
                    onTap: () => cubit.changeStep(stepIndex),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? AppTheme.primary : Colors.grey,
                      ),
                      child: Center(
                        child: CustomText(
                          text: "${stepIndex + 1}",
                          size: 16,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  bool isActive = (index ~/ 2) <= cubit.currentSteps - 1;
                  return Expanded(
                    child: Container(
                      height: 2.h,
                      color: isActive ? AppTheme.primary : Colors.grey,
                    ),
                  );
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
