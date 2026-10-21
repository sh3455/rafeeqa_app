import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_info_step.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/birth_details_step.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/setup_baby_steps.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/vaccination_step.dart';
import 'package:rafeeqa/generated/l10n.dart';

class SetupBabyBody extends StatelessWidget {
  const SetupBabyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);
    final s = S.of(context);

    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        final data = setUpData(context);
        final isLastPage = cubit.currentSteps == SetupCubit.totalSteps - 1;

        final nextButton = Padding(
          padding: EdgeInsets.all(18.r),
          child: CustomButton(
            onPressed: () {
              if (isLastPage) {
              } else {
                cubit.nextStep();
              }
            },
            text: isLastPage ? s.getStarted : s.next,
            color: AppTheme.primary,
            borderRadius: 20.r,
          ),
        );

        return SafeArea(
          child: Column(
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
                  children: [
                    _StepPage(footer: nextButton, child: BabyInfoStep(setupModel: data[0])),
                    _StepPage(footer: nextButton, child: BirthDetailsStep(setupModel: data[1]) ),
                    _StepPage(footer: nextButton, child: VaccinationStep(setupModel: data[2],)),
                    _StepPage(footer: nextButton, child: const Center(child: Text('Step 4'))),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StepPage extends StatelessWidget {
  const _StepPage({required this.child, required this.footer});

  final Widget child;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          child,
          footer,
        ],
      ),
    );
  }
}