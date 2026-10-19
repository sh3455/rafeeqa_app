import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart' show AppTheme;
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/features/setup/data/model/setup_model.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/baby_info_step.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/setup_baby_steps.dart';
import 'package:rafeeqa/generated/l10n.dart';

class SetupBabyBody extends StatefulWidget {
  const SetupBabyBody({super.key});

  @override
  State<SetupBabyBody> createState() => _SetupBabyBodyState();
}

class _SetupBabyBodyState extends State<SetupBabyBody> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = SetupCubit.get(context);
    final data = setUpData(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.all(12.w),
          child: const SetupBabySteps(),
        ),
        Expanded(
          child: PageView(
            controller: cubit.controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => setState(() => currentPage = index),
            children: [
              BabyInfoStep(setupModel: data[0]),
              Center(child: Text('Step 2')),
              Center(child: Text('Step 3')),
              Center(child: Text('Step 4')),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        _CustomButton(
          pageController: cubit.controller,
          currentPages: currentPage,
          totalPages: data.length,
        ),
      ],
    );
  }

}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.pageController, 
  required this.currentPages, 
  required this.totalPages});

 final PageController pageController;
 final int currentPages ;
 final int totalPages;

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final bool isLastPage = currentPages == totalPages-1;

    return Padding(
      padding: EdgeInsets.all(18.r),
      child: CustomButton(
        onPressed: () {
         // NavTo.pushReplacement(context: context, nextPage: SplashView());
          if (isLastPage){

          }else{
            pageController.nextPage(
              duration: Duration(milliseconds: 300), 
              curve: Curves.easeInOut);
          }

        },
         text: isLastPage ? s.getStarted :s.next,
         color: AppTheme.primary,
         borderRadius:20.r ,
         ),
    );
  }
}