import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class VaccineGroup extends StatelessWidget {
  const VaccineGroup({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppTheme.secondary.withValues(alpha: isDark ? 0.15 : 0.10),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 10.h),
            child: CustomText(text: title, size: 15.sp, type: Type.overMedium),
          ),
          for (int i = 0; i < children.length; i++) ...[
            if (i > 0) SizedBox(height: 6.h),
            children[i],
          ],
        ],
      ),
    );
  }
}
