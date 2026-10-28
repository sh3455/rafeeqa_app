import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/const/assets.dart';
import 'package:rafeeqa/core/utils/nav_to.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/allset_twin_dialog.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/generated/l10n.dart';

class AllSetSteps extends StatelessWidget {
  const AllSetSteps({super.key, required this.setupModel});
  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);
    final s = S.of(context);

    return Column(
      children: [
        BabyCard(setupModel: setupModel),
        SizedBox(height: 12.h),
        for (final baby in cubit.allBabies)
          BabySummaryCard(
            name: baby.name,
            age: cubit.ageText(baby.dateOfBirth),
            gender: baby.gender,
            isBoy: baby.gender == 'Boy',
            progressText:
                '${baby.vaccinations.length} of ${cubit.vaccination.length} completed',
            image: baby.image != null ? FileImage(File(baby.image!)) : null,
          ),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: CustomButton(
            icon: Icons.add,
            text: s.addAnotherBaby,
            enableBorderColor: true,
            color: AppTheme.primary,
            borderRadius: 15.r,
            onPressed: () => _showTwinDialog(context, cubit),
          ),
        ),
      ],
    );
  }

  void _showTwinDialog(BuildContext context, SetupCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AllSetTwinDialog(
        onYes: () async {
          NavTo.pop(dialogContext);
          if (await cubit.saveCurrentBaby()) cubit.startTwin();
        },
        onNo: () async {
          NavTo.pop(dialogContext);
          if (await cubit.saveCurrentBaby()) cubit.startNewBaby();
        },
      ),
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
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(theme),
          SizedBox(height: 14.h),
          _InfoRow(
            icon: Icons.calendar_month_outlined,
            label: "Age",
            value: age,
            color: theme.colorScheme.primary,
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
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppTheme.primary.withValues(alpha: 0.4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.15),
                blurRadius: 10,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 34.r,
            backgroundColor: AppTheme.primary.withValues(alpha: 0.1),
            backgroundImage: image ?? const AssetImage(Assets.iconImage),
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              _buildGenderTag(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenderTag(ThemeData theme) {
    final color = isBoy
        ? theme.colorScheme.secondary
        : theme.colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isBoy ? Icons.male : Icons.female, size: 16.r, color: color),
          SizedBox(width: 4.w),
          CustomText(
            text: gender,
            size: 12.sp,
            type: Type.overMedium,
            color: color,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).hintColor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.r, color: color),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: label,
                  size: 11.sp,
                  type: Type.overSmall,
                  color: textColor,
                  opacity: FontOpacity.medium,
                ),
                CustomText(
                  text: value,
                  size: 14.sp,
                  type: Type.overMedium,
                  color: textColor,
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