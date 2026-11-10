import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: isSelected
                ? primary.withValues(alpha: 0.08)
                : theme.cardColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isSelected
                  ? primary.withValues(alpha: 0.5)
                  : theme.dividerColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconCircle(icon: icon, color: primary),
              SizedBox(width: 10.w),
              CustomText(
                text: title,
                size: 16.sp,
                type: Type.overMedium,
                color: theme.hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.12),
      ),
      child: Icon(icon, size: 20.sp, color: color),
    );
  }
}
