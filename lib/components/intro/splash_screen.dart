import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adalearn_core/adalearn_core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppOverlay.setSplashUIOverlay();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: AppColor.primary),
      child: Center(
        child: Image.asset(
          "./assets/images/full_logo.png",
          width: 300.w,
        ),
      ),
    ));
  }
}
