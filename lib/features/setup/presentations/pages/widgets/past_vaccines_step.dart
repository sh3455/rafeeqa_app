import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';

class PastVaccinesStep extends StatelessWidget {
  const PastVaccinesStep({super.key, required this.setupModel});

  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BabyCard(setupModel: setupModel),
        SizedBox(height: 10.h),
        VaccineGroupHeader(title: "At birth"),
      ],
    );
  }
}

class VaccineGroupHeader extends StatelessWidget {
  const VaccineGroupHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppTheme.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CustomText(text: title, size: 16.sp, type: Type.overMedium),
    );
  }
}
