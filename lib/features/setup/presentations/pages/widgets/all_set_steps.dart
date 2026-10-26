import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/const/assets.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';

class AllSetSteps extends StatelessWidget {
  const AllSetSteps({super.key, required this.setupModel});
  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    var cubit = SetupCubit.get(context);
    return Column(
      children: [
        BabyCard(setupModel: setupModel),
        SizedBox(height: 12.h),
        BabySummaryCard(
          name: cubit.nameController.text.trim(),
          age: cubit.babyAgeText,
          gender: cubit.selectedGender ?? '',
          isBoy: cubit.isBoy,
          progressText: cubit.vaccinesProgressText,
          image: cubit.image != null ? FileImage(cubit.image!) : null,
        ),
       
      ],
    );
  }
}

class BabySummaryCard extends StatelessWidget {
  const BabySummaryCard({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.progressText,
    this.image,
    this.isBoy = true,
  });

  final String name;
  final String age;
  final String gender;
  final String progressText;
  final ImageProvider? image;
  final bool isBoy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              children: [
                _BabyAvatar(image: image),
                SizedBox(width: 14.w),
                Expanded(
                  child: _BabyHeader(name: name, gender: gender, isBoy: isBoy),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            _InfoRow(
              icon: Icons.calendar_month_outlined,
              label: "Age",
              value: age,
            ),
            SizedBox(height: 10.h),
            _InfoRow(
              icon: Icons.vaccines_outlined,
              label: "Vaccines",
              value: progressText,
              color: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _BabyAvatar extends StatelessWidget {
  const _BabyAvatar({this.image});

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primary.withValues(alpha: 0.4), width: 2),
        boxShadow: [
          BoxShadow(color: primary.withValues(alpha: 0.15), blurRadius: 10),
        ],
      ),
      child: CircleAvatar(
        radius: 34.r,
        backgroundColor: primary.withValues(alpha: 0.1),
        backgroundImage: image ?? const AssetImage(Assets.iconImage),
      ),
    );
  }
}

class _BabyHeader extends StatelessWidget {
  const _BabyHeader({
    required this.name,
    required this.gender,
    required this.isBoy,
  });

  final String name;
  final String gender;
  final bool isBoy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final genderColor = isBoy
        ? theme.colorScheme.secondary
        : theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: name,
          size: 20.sp,
          type: Type.header,
          color: theme.hintColor,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: genderColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isBoy ? Icons.male_rounded : Icons.female_rounded,
                size: 16.r,
                color: genderColor,
              ),
              SizedBox(width: 4.w),
              CustomText(
                text: gender,
                size: 12.sp,
                type: Type.overMedium,
                color: genderColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = color ?? theme.colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16.r, color: accent),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: label,
                  size: 11.sp,
                  type: Type.overSmall,
                  color: theme.hintColor,
                  opacity: FontOpacity.medium,
                ),
                CustomText(
                  text: value,
                  size: 14.sp,
                  type: Type.overMedium,
                  color: theme.hintColor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
