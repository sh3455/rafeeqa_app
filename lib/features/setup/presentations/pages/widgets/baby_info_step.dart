// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/const/assets.dart' show Assets;
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/custom_text_field.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/field_label_text.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/option_card.dart';
import 'package:rafeeqa/generated/l10n.dart';

class BabyInfoStep extends StatelessWidget {
  const BabyInfoStep({super.key, required this.setupModel});

  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    var cubit = SetupCubit.get(context);
    final s = S.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          BabyCard(setupModel: setupModel),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FieldLabel(icon: Icons.people_alt_outlined, title: s.babyName),

                CustomTextField(
                  hintText: s.babyNameHint,
                  readOnly: false,
                  controller: cubit.nameController,
                ),

                SizedBox(height: 6.h),

                FieldLabel(
                  icon: Icons.calendar_today_outlined,
                  title: s.dateOfBirth,
                ),

                CustomTextField(
                  hintText: s.dateOfBirthHint,
                  suffixIcon: Icon(Icons.calendar_today_outlined, size: 22.sp),
                  readOnly: true,
                  controller: cubit.birthController,
                  onTap: () => cubit.pickDate(context),
                ),

                SizedBox(height: 6.h),

                FieldLabel(icon: Icons.child_care, title: s.gender),
                Row(
                  children: [
                    OptionCard(
                      icon: Icons.male,
                      title: s.boy,
                      isSelected: cubit.selectedGender == "Boy",
                      onTap: () => cubit.selectGender("Boy"),
                    ),
                    SizedBox(width: 12.w),
                    OptionCard(
                      icon: Icons.female,
                      title: s.girl,
                      isSelected: cubit.selectedGender == "Girl",
                      onTap: () => cubit.selectGender("Girl"),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                FieldLabel(
                  icon: Icons.add_a_photo_outlined,
                  title: s.addPhoto,
                  subtitle: s.optional,
                ),

                SizedBox(height: 10.h),

                _Photopicker(onTap: () => cubit.pickerImage()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Photopicker extends StatelessWidget {
  const _Photopicker({this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var cubit = SetupCubit.get(context);
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
            ),
            child: ClipOval(
              child: cubit.image != null
                  ? Image.file(cubit.image!, fit: BoxFit.cover)
                  : Image.asset(Assets.iconImage, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 64.h,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 22.sp,
                      color: theme.hintColor,
                    ),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'Change photo',
                      size: 14.sp,
                      type: Type.overMedium,
                      color: theme.hintColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
