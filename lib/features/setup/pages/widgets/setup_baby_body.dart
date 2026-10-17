import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/features/setup/pages/widgets/setup_baby_steps.dart';

class SetupBabyBody extends StatelessWidget {
  const SetupBabyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.all(12),
          child: SetupBabySteps()),
      ],
    );
  }
}