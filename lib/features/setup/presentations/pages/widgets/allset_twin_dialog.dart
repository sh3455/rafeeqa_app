import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/const/assets.dart';
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/generated/l10n.dart';

class AllSetTwinDialog extends StatelessWidget {
  const AllSetTwinDialog({super.key, required this.onYes, required this.onNo});

  final VoidCallback onYes;
  final VoidCallback onNo;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Dialog(
      backgroundColor: theme.cardColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CloseButton(),
            ),
            CustomText(
              text: s.twinDialogTitle,
              size: 20.sp,
              type: Type.header,
              color: theme.hintColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: s.twinDialogDescription,
              size: 14.sp,
              type: Type.medium,
              color: theme.hintColor,
              opacity: FontOpacity.medium,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 16.h),
            Image.asset(Assets.showDialogImage),
            SizedBox(height: 20.h),
            CustomButton(
              text: s.yesTwin,
              color: primary,
              borderRadius: 16.r,
              onPressed: onYes,
            ),
            SizedBox(height: 12.h),
            CustomButton(
              text: s.noDifferentBirthDate,
              color: primary,
              enableBorderColor: true,
              borderRadius: 16.r,
              onPressed: onNo,
            ),
          ],
        ),
      ),
    );
  }
}
