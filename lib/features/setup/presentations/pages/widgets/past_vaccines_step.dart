import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/model/vaccination_model.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_text.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/vaccines_card.dart';

class PastVaccinesStep extends StatelessWidget {
  const PastVaccinesStep({super.key, required this.setupModel});

  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);

    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        final vaccinations = cubit.vaccination;

        if (state is SetupVaccinationsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SetupVaccinationsFailureState) {
          return Center(child: Text(state.message));
        }
        if (vaccinations.isEmpty) {
          return const SizedBox.shrink();
        }

        final Map<double, List<VaccinationModel>> groupedVaccinations = {};

        for (final v in vaccinations) {
          if (groupedVaccinations.containsKey(v.age)) {
            groupedVaccinations[v.age]!.add(v);
          } else {
            groupedVaccinations[v.age] = [v];
          }
        }

        return Column(
          children: [
            BabyCard(setupModel: setupModel),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _SelectAllTile(
                    isSelected: cubit.isAllVaccinesSelected,
                    onTap: cubit.toggleSelectAllVaccines,
                  ),
                  SizedBox(height: 12.h),
                  for (final group in groupedVaccinations.entries) ...[
                    VaccineGroup(
                      title: cubit.getVaccinationAgeTitle(group.key),
                      children: [
                        for (final v in group.value)
                          VaccinesCard(
                            title: v.name,
                             subtitle: v.reason,
                            isSelected: cubit.selectedVaccineIds.contains(v.id),
                            onTap: () => cubit.toggleVaccine(v.id),
                          ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SelectAllTile extends StatelessWidget {
  const _SelectAllTile({required this.onTap, required this.isSelected});

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            _SelectAllBox(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _SelectAllBox extends StatelessWidget {
  const _SelectAllBox({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = theme.colorScheme.secondary;
    final unselectedColor = theme.colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 22.r,
      height: 22.r,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isSelected ? selectedColor : unselectedColor,
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Icon(Icons.check, size: 16.sp, color: Colors.white)
          : null,
    );
  }
}

class VaccineGroup extends StatelessWidget {
  const VaccineGroup({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppTheme.secondary.withValues(alpha: isDark ? 0.15 : 0.2),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: CustomText(text: title, size: 16.sp, type: Type.overMedium),
        ),
        SizedBox(height: 8.h),
        for (int i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(height: 6.h),
          children[i],
        ],
      ],
    );
  }
}