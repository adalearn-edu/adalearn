import 'package:adalearn/components/auth/auth_controller.dart';
import 'package:adalearn/components/auth/enter_phone_screen.dart';
import 'package:adalearn/components/auth/verify_otp_screen.dart';
import 'package:adalearn_core/components/common_components/buttons/tinkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController pageController = PageController();
  late AuthController authController;

  @override
  void initState() {
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageController.page == 1) {
          pageController.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: TinkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                PhoneAuthScreen(
                  pageController: pageController,
                ),
                const VerifyOTPScreen(),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    authController.dispose();
    Get.delete<AuthController>();
    super.dispose();
  }
}
