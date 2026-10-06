import 'package:flutter/material.dart';

import '../../../const/assets.dart';
import '../../../generated/l10n.dart';

class OnboardingModel {
  int id;
  String image;
  String title; 
  String description;
  
  OnboardingModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingData (BuildContext context){
  var s = S.of(context);
  return [
    OnboardingModel(
      id: 1,
      image: Assets.onboarding1,
      title: s.onboardingTitle1,
      description: s.onboardingDescription1,
    ),
    OnboardingModel(
      id: 2,
      image: Assets.onboarding2,
      title: s.onboardingTitle2,
      description: s.onboardingDescription2,
    ),
    OnboardingModel(
      id: 3,
      image: Assets.onboarding3,
      title: s.onboardingTitle3,
      description: s.onboardingDescription3,
    ),
  ];
}