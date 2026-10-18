
import 'package:flutter/material.dart';
import 'package:rafeeqa/const/assets.dart';
import 'package:rafeeqa/generated/l10n.dart';

class SetupModel {
  String? image;
  String title;
  String description;

  SetupModel({
    this.image,
    required this.title,
    required this.description,
  });
}

List<SetupModel> setUpData(BuildContext context) {
  var s = S.of(context);
  return [
    SetupModel(
      image: Assets.setUp1,
      title: s.setupTitle1,
      description: s.setupDescription1,
    ),
    SetupModel(
      image: Assets.setUp2,
      title: s.setupTitle2,
      description: s.setupDescription2,
    ),
    SetupModel(
      image: Assets.setUp3,
      title: s.setupTitle3,
      description: s.setupDescription3,
    ),
    SetupModel(
      title: s.setupTitle4,
      description: s.setupDescription4,
    ),
    SetupModel(
      title: s.setupTitle5,
      description: s.setupDescription5,
    ),
    SetupModel(
      image: Assets.setUp4,
      title: s.setupDescription6,
      description:s.setupDescription6,
    ),
  ];
}