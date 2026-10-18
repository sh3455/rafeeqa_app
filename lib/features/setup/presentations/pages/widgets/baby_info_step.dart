// ignore_for_file: unused_element_parameter

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rafeeqa/const/assets.dart';
import 'package:rafeeqa/core/services/image_picker_service.dart';
import 'package:rafeeqa/core/utils/styles.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';

class BabyInfoStep extends StatefulWidget {
  const BabyInfoStep({super.key, required this.setupModel});
  final SetupModel setupModel;

  @override
  State<BabyInfoStep> createState() => _BabyInfoStepState();
}

class _BabyInfoStepState extends State<BabyInfoStep> {
  String? selectGender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BabyCard(setupModel: widget.setupModel),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FieldLabel(icon: Icons.person_outline, title: 'Baby name'),
                SizedBox(height: 10.h),
                _BabyNameField(),
                SizedBox(height: 24.h),
                _FieldLabel(icon: Icons.calendar_today_outlined, title: 'Date of birth'),
                SizedBox(height: 10.h),
                _BirthDateField(),
                SizedBox(height: 24.h),
                _FieldLabel(icon: Icons.child_care_outlined, title: 'Gender'),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    _GenderOption(
                      icon: Icons.male,
                      title: 'Boy',
                      isSelected: selectGender == 'Boy',
                      onTap: () => setState(() => selectGender = 'Boy'),
                    ),
                    SizedBox(width: 12.w),
                    _GenderOption(
                      icon: Icons.female,
                      title: 'Girl',
                      isSelected: selectGender == 'Girl',
                      onTap: () => setState(() => selectGender = 'Girl'),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _FieldLabel(
                  icon: Icons.add_a_photo_outlined,
                  title: 'Add a photo',
                  subtitle: '(optional)',
                ),
                SizedBox(height: 10.h),
                _PhotoPicker(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.icon, required this.title, this.subtitle});

  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).hintColor;

    return Row(
      children: [
        Icon(icon, size: 24.sp, color: color),
        SizedBox(width: 10.w),
        CustomText(text: title, size: 16.sp, type: Type.overMedium, color: color),
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
    );
  }
}

class _BabyNameField extends StatelessWidget {
  const _BabyNameField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.textStyle600.copyWith(
        fontSize: 18.sp,
        color: Theme.of(context).hintColor,
      ),
      decoration: InputDecoration(
        hintText: 'Yousef',
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.w),
      ),
    );
  }
}

class _BirthDateField extends StatefulWidget {
  const _BirthDateField();

  @override
  State<_BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<_BirthDateField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _controller.text = DateFormat('MMM d, y').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).hintColor;

    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: () => _pickDate(),
      style: Styles.textStyle600.copyWith(
        fontSize: 14.sp,
        color: color,
      ),
      decoration: InputDecoration(
        hintText: 'Apr 15, 2026',
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.w),
        suffixIcon: Icon(Icons.calendar_today_outlined, size: 22.sp, color: color),
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.icon,
    required this.title,
    this.isSelected = false,
    required this.onTap,
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
            color: isSelected ? primary.withValues(alpha: 0.08) : theme.cardColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isSelected ? primary.withValues(alpha: 0.5) : theme.dividerColor,
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

class _PhotoPicker extends StatefulWidget {
  const _PhotoPicker();

  @override
  State<_PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<_PhotoPicker> {
  File? _image;
  final _service = ImagePickerService.instance;

  Future<void> _pickImage() async {
    final image = await _service.pickImageFromGallery();
    if (image != null) {
      setState(() => _image = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PhotoPreview(image: _image),
        SizedBox(width: 16.w),
        Expanded(child: _ChangePhotoButton(onTap: _pickImage)),
      ],
    );
  }
}

class _PhotoPreview extends StatelessWidget {
  const _PhotoPreview({this.image});

  final File? image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 90.w,
      height: 90.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
      ),
      child: ClipOval(
        child: image != null
            ? Image.file(image!, fit: BoxFit.cover)
            : Image.asset(Assets.iconImage, fit: BoxFit.cover),
      ),
    );
  }
}

class _ChangePhotoButton extends StatelessWidget {
  const _ChangePhotoButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
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
            _IconCircle(icon: Icons.photo_camera_outlined, color: theme.hintColor),
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