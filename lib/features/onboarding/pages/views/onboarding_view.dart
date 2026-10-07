// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/core/widgets/custom_button.dart';
import 'package:rafeeqa/features/onboarding/model/onboarding_model.dart';
import 'package:rafeeqa/features/onboarding/pages/widgets/onboarding_body.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../../generated/l10n.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  final PageController _controller = PageController();

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = onboardingData(context);

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          spacing: 10.h,
          children: [
            _Skip(pageController: _controller,totalPage: pages.length, ),
            Expanded(
              child: OnboardingBody(
              pageController: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  
                });
              },
              )),
            _CustomButton(
              pageController: _controller,
              currentPages:currentPage,
              totalPages: pages.length,

              )
          ],
        ),
      )
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

//skip
class _Skip extends StatelessWidget {
  const _Skip({required this.pageController, required this.totalPage});

 final PageController pageController;
 final int totalPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){

              pageController.jumpToPage(totalPage - 1);

            },
            child: CustomText(
              text: "skip",
               size: 18.sp,
               type: Type.medium,
               opacity: FontOpacity.medium
            )
          ),
        ],
      ),
    );
    
  }
}



