import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';

class BabyCard extends StatelessWidget {
  const BabyCard({super.key, required this.setupModel});

  final SetupModel setupModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          //  Spacer(flex: 3,),
            _Image(imagePath: setupModel.image!),
         //   Spacer(flex: 3,),
            _Text(setupModel: setupModel),
         //   Spacer(flex:1),

        ]
      ),
    );
  
  }
}

// ignore: camel_case_types
class _Image extends StatelessWidget {
  const _Image({required this.imagePath});

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
  const _Text({ required this.setupModel});

  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
       // color: Theme.of(context).colorScheme.onSurface,
          text: setupModel.title,
          size: 20.sp,
          textAlign: TextAlign.center,
          type: Type.header,
        ),
        SizedBox(height: 10.h,),
        CustomText(
        // color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .6),
          text: setupModel.description,
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

