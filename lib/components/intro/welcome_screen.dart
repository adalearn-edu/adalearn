import 'package:adalearn/components/auth/auth_screen.dart';
import 'package:adalearn/components/intro/welcome_controller.dart';
import 'package:adalearn_core/adalearn_core.dart';
import 'package:adalearn_core/components/common_components/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeController welcomeController = WelcomeController();

  @override
  void initState() {
    welcomeController.scrollPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppOverlay.setDefaultUIOverlay();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 44,
                ),
                Text(
                  "Manage your Institution digitally",
                  style: AppStyles.h3.copyWith(fontWeight: FontWeight.w400),
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Easy ",
                            style: TextStyle(color: AppColor.primary)),
                        TextSpan(
                            text: "and Secure",
                            style: TextStyle(color: AppColor.text)),
                      ],
                      style: AppStyles.h1.copyWith(
                          fontFamily: "Outfit", color: AppColor.text)),
                ),
                SizedBox(
                  height: 4.w,
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        const TextSpan(text: "with "),
                        TextSpan(
                            text: "ada",
                            style: TextStyle(color: AppColor.primary)),
                        TextSpan(
                            text: "learn",
                            style: TextStyle(color: AppColor.text)),
                      ],
                      style: AppStyles.p1.copyWith(
                          fontFamily: "Outfit", color: AppColor.text)),
                )
              ],
            ),
            Expanded(
              child: PageView(
                controller: welcomeController.welcomePageController,
                allowImplicitScrolling: true,
                children: [
                  Image.asset("./assets/images/staff.png"),
                  Image.asset("./assets/images/professional_with_computer.jpg"),
                  Image.asset("./assets/images/staff.png"),
                ],
              ),
            ),
            PrimaryButton(
              text: "Get Started",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.w,
            ),
            const Text(
              "By continuing you agree to our terms of service and privacy policy",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    welcomeController.dispose();
    super.dispose();
  }
}
