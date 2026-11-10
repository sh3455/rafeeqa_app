import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).hintColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color: color),
          SizedBox(width: 10.w),
          CustomText(
            text: title,
            size: 16.sp,
            type: Type.overMedium,
            color: color,
          ),
          if (subtitle != null) ...[
            SizedBox(width: 4.w),
            CustomText(
              text: subtitle!,
              size: 14.sp,
              type: Type.small,
              color: color,
              opacity: FontOpacity.medium,
            ),
          ],
        ],
      ),
    );
  }
}
