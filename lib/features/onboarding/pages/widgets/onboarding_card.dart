// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/features/onboarding/model/onboarding_model.dart';

import '../../../../core/widgets/custom_text.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
            _skip(),
            Spacer(flex: 3,),
            _image(imagePath: model.image),
            Spacer(flex: 3,),
            _Text(onboradingModel: model),
            Spacer(flex:1),

        ]
      ),
    );
  }
}

class _skip extends StatelessWidget {
  const _skip();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){},
            child: CustomText(
              text: "skip",
               size: 18.sp,
               type: Type.medium,
               opacity: FontOpacity.medium
            )
          ),
        ],
      ),
    );
    
  }
}

class _image extends StatelessWidget {
  const _image({required this.imagePath});

  final String imagePath ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Image.asset(
      imagePath,
      width: size.width * 0.8,
      height: size.height * 0.3,
    );
  }
}


class _Text extends StatelessWidget {
  const _Text({ required this.onboradingModel});

  final OnboardingModel onboradingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          //color: AppTheme.darkSurface,
          text: onboradingModel.title,
          size: 20.sp,
          textAlign: TextAlign.center,
          type: Type.header,
        ),
        SizedBox(height: 10.h,),
        CustomText(
         // color: AppTheme.darkSurface,
          text: onboradingModel.description,
          size: 16.sp,
          type: Type.overMedium,
          opacity: FontOpacity.medium,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );

  }
}

