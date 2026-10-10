// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const/assets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {
late AnimationController _gentlePulseController;
late Animation<double> _gentlePulseAnimation;

void initState(){
    super.initState();
  _gentlePulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  _gentlePulseAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
    CurvedAnimation(
      parent: _gentlePulseController,
      curve: Curves.easeInOut,
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gentlePulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _gentlePulseAnimation.value,
          child: child,
        );
      },
      child: Column(
        children: [
          SizedBox(height: 120.h),
          Center(
            child: Image.asset(Assets.splashNative),
            ),
        ],
      ),
    );
  }
}