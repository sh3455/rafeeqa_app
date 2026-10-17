import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/setup_baby_steps.dart';

class SetupBabyBody extends StatelessWidget {
  const SetupBabyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.all(12.w),
          child: const SetupBabySteps(),
        ),
        Expanded(
          child: PageView(
            controller: cubit.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Center(child: Text('Step 1: Baby info')),
              Center(child: Text('Step 2: Birth details')),
              Center(child: Text('Step 3: Vaccinated?')),
              Center(child: Text('Step 4: Select vaccines')),
            ],
          ),
        ),
      ],
    );
  }
}