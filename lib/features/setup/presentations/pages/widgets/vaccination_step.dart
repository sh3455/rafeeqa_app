import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/generated/l10n.dart';

class VaccinationStep extends StatelessWidget {
   const VaccinationStep({super.key, required this.setupModel});
  final SetupModel setupModel;



  @override
  Widget build(BuildContext context) {
    var cubit = SetupCubit.get(context);
    final s = S.of(context);

    final options = [
    (s.vaccinatedAll, s.vaccinatedAllDesc),
    (s.vaccinatedSome, s.vaccinatedSomeDesc),
    (s.vaccinatedNotSure, s.vaccinatedNotSureDesc),
  ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          BabyCard(setupModel: setupModel)  ,
        
          SizedBox(height:20.h,),
      
          Column(
            children: List.generate(options.length, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: VaccineOptionCard(
              title: options[i].$1,
              subtitle: options[i].$2,
              isSelected: cubit.selectedVaccineOption == i,
              onTap: () => cubit.selectVaccineOption(i),
            ),
          );
        }),
          )
        ],
      ),
    );
  }
}



class VaccineOptionCard extends StatelessWidget {
  const VaccineOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppTheme.secondary : AppTheme.primary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color:isSelected? color.withValues(alpha: 0.10) : AppTheme.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: color.withValues(alpha: isSelected ? 0.6 : 0.4),
            width: 1.5.w,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28.r,
              height: 28.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? color : Colors.transparent,
                border: Border.all(color: color, width: 2.w),
              ),
              child: isSelected
                  ? Icon(Icons.check_rounded, size: 18.r, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 14.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: title,
                    size: 16.sp,
                    type: Type.overMedium,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: subtitle,
                    size: 14.sp,
                    type: Type.overSmall,
                    opacity: FontOpacity.medium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}