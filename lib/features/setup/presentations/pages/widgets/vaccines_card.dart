import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';

class VaccinesCard extends StatelessWidget {
  const VaccinesCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isSelected = false,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = isSelected
        ? theme.colorScheme.secondary
        : theme.colorScheme.primary;
    final radius = BorderRadius.circular(16.r);

    return Material(
      color: theme.cardColor,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: accent.withValues(alpha: isSelected ? 0.30 : 0.18),
            ),
          ),
          child: Row(
            children: [
              _SelectBox(isSelected: isSelected, accent: accent),
              SizedBox(width: 12.w),
              Expanded(
                child: _VaccineInfo(title: title, subtitle: subtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectBox extends StatelessWidget {
  const _SelectBox({required this.isSelected, required this.accent});

  final bool isSelected;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 44.r,
      height: 44.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accent.withValues(alpha: isSelected ? 0.15 : 0.08),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 22.r,
        height: 22.r,
        decoration: BoxDecoration(
          color: isSelected ? accent : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: accent, width: 1.5),
        ),
        child: isSelected
            ? Icon(Icons.check, size: 16.r, color: Colors.white)
            : null,
      ),
    );
  }
}

class _VaccineInfo extends StatelessWidget {
  const _VaccineInfo({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).hintColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title,
          size: 14.sp,
          type: Type.overMedium,
          color: color,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 2.h),
        CustomText(
          text: subtitle,
          size: 12.sp,
          type: Type.overSmall,
          color: color,
          opacity: FontOpacity.medium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
