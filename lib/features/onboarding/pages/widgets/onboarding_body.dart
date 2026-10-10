// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:rafeeqa/features/onboarding/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_card.dart';

class OnboardingBody extends StatelessWidget {
   const OnboardingBody({
    super.key,
    required this.pageController,
     this.onPageChanged
     });


  final PageController pageController;
  final ValueChanged<int>? onPageChanged;

  @override
  Widget build(BuildContext context) {
    var data = onboardingData(context);
    return Column(
        children: [
          Expanded(
            child:PageView.builder(
              controller: pageController,
              onPageChanged: onPageChanged,
              itemCount: data.length,
              itemBuilder: (context , index){
                return OnboardingCard(model: data[index]);
              }
              )
          ),
          _PageIndicator(pageController:pageController)
      ],);

  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var data = onboardingData(context);
    final colors = Theme.of(context).colorScheme;
    return SmoothPageIndicator(
      controller: pageController ,
       count: data.length,
       effect: ExpandingDotsEffect(
        spacing: 8,
        dotWidth: 8,
        dotHeight: 8,
        radius: 8, 
        dotColor: colors.outlineVariant,
        activeDotColor: colors.primary,
       ),
       );
  }
}
