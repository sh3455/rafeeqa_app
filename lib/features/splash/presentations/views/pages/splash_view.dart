import 'dart:async';

import 'package:flutter/material.dart';
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
   Future.delayed(const Duration(seconds: 3), () {
      
    if (!mounted) return;
    
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
       decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splashBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: SplashBody()
      ),
      
    );
  }
}