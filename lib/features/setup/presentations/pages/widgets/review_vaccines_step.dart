import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_state.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_card.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/vaccine_group.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/vaccines_card.dart';

class ReviewVaccinesStep extends StatelessWidget {
  const ReviewVaccinesStep({super.key, required this.setupModel});

  final SetupModel setupModel;

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);

    return Column(
      children: [
        BabyCard(setupModel: setupModel),
        SizedBox(height: 12.h),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            final groups = cubit.reviewGrouped;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  for (final g in groups.entries) ...[
                    VaccineGroup(
                      title: cubit.getVaccinationAgeTitle(g.key),
                      children: [
                        for (final v in g.value)
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
            );
          },
        ),
      ],
    );
  }
}
