// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/nav_to.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/features/onboarding/pages/widgets/onboarding_body.dart';
import 'package:rafeeqa/features/splash/presentations/views/pages/splash_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10.h,
        children: [
          Expanded(child: OnboardingBody()),
          _CustomButton()
        ],
      )
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: CustomButton(
        onPressed: () {
          NavTo.push(context: context, nextPage: SplashView());
        },
         text: "Next",
         color: AppTheme.primary,
         borderRadius:20.r ,
         ),
    );
  }
}