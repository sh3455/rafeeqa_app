import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class SelectAllTile extends StatelessWidget {
  const SelectAllTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: "Select all",
              size: 16.sp,
              type: Type.overMedium,
              color: theme.hintColor,
            ),
          ),
          Container(
            width: 22.r,
            height: 22.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
