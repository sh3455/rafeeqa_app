import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/custom_text_field.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/field_label_text.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/option_card.dart';

class BirthDetailsStep extends StatelessWidget {
  const BirthDetailsStep({super.key, required this.setupModel});
  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    var cubit = SetupCubit.get(context);
    return Column(
      children: [
        BabyCard(setupModel: setupModel),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldLabel(
                icon: Icons.health_and_safety_outlined,
                title: "Type of birth",
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  OptionCard(
                    icon: Icons.pregnant_woman,
                    title: "Natural birth",
                    isSelected: cubit.typeOfBirth == "Natural birth",
                    onTap: () => cubit.selectTypeOfBirth("Natural birth"),
                  ),
                  SizedBox(width: 12.w),
                  OptionCard(
                    icon: Icons.child_care,
                    title: 'C-section',
                    isSelected: cubit.typeOfBirth == "C-section",
                    onTap: () => cubit.selectTypeOfBirth("C-section"), 
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              FieldLabel(
                icon: Icons.monitor_weight_outlined,
                title: "Birth weight",
              ),
              const CustomTextField(
                hintText: "3.2 kg",
                readOnly: false,
                suffixIcon: Icon(Icons.monitor_weight_outlined),
              ),
              SizedBox(height: 8.h),
              FieldLabel(icon: Icons.height, title: "Birth height"),
              const CustomTextField(
                hintText: "50 cm",
                readOnly: false,
                suffixIcon: Icon(Icons.height),
              ),
            ],
          ),
        ),
      ],
    );
  }
}