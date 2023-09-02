// ignore_for_file: use_build_context_synchronously

import 'package:adalearn/common_controllers/app_controller.dart';
import 'package:adalearn/components/auth/auth_controller.dart';
import 'package:adalearn_core/components/authentication/otp_verify_components.dart';
import 'package:adalearn_core/components/common_components/buttons/hyper_text_button.dart';
import 'package:adalearn_core/adalearn_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});
  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  late AuthController authController;
  @override
  void initState() {
    super.initState();
    authController = Get.find<AuthController>();
    authController.startResendOtpTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We sent you a code to verify your Organisation",
              style: AppStyles.h4,
            ),
            SizedBox(
              height: 24.w,
            ),
            Obx(
              () => VerifyOtpComponent.otpTextField(
                  onSucess: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Get.find<AppController>().initApp();
                  },
                  authController: Get.find<AuthController>()),
            ),
            SizedBox(
              height: 24.w,
            ),
            Obx(
              () => Center(
                child: authController.resendOtpTimer.value == 0
                    ? Column(
                        children: [
                          Text(
                            "I didn't recieve a code?",
                            style: AppStyles.p2
                                .copyWith(color: AppColor.teritaryColor),
                          ),
                          HyperTextButton(
                              text: "Resend Code",
                              onTap: () {
                                authController.startResendOtpTimer();
                              })
                        ],
                      )
                    : Text(
                        "Retry in ${authController.resendOtpTimer.value} seconds...",
                        style: AppStyles.p2.copyWith(
                          color: AppColor.teritaryColor,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
