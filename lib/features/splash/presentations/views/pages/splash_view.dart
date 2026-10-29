// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rafeeqa/core/utils/nav_to.dart';
import 'package:rafeeqa/di/server_locator.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/view/setup_baby_view.dart';
import 'package:rafeeqa/features/splash/presentations/views/widgets/splash_body.dart';

import '../../../../../const/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here if needed
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      if (getIt<SettingsCubit>().state.isFirstTime) {
        NavTo.pushReplacement(
          context: context,
          nextPage: const SetupBabyView(),
        );
      } else {
        // Navigate to home screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splashBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: SplashBody(),
      ),
    );
  }
}
