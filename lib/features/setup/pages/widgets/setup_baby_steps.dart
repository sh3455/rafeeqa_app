import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class SetupBabySteps extends StatefulWidget {
  const SetupBabySteps({super.key});

  @override
  State<SetupBabySteps> createState() => _SetupBabyStepsState();
}

class _SetupBabyStepsState extends State<SetupBabySteps> {
  int currentSteps = 1;
  int totalSteps = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            if (index % 2 == 0) {
              int stepIndex = index ~/ 2;
              bool isActive = stepIndex < currentSteps;
              return Container(
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
              );
            } else {
              bool isActive = (index ~/ 2) < currentSteps - 1;
              return Expanded(
                child: Container(
                  height: 2.h,
                  color: isActive ? AppTheme.primary : Colors.grey,
                ),
              );
    }
  }),
)
      ),
    );
 
}

}
