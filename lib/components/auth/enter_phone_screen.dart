import 'package:adalearn/components/auth/auth_controller.dart';
import 'package:adalearn_core/components/common_components/buttons/primary_button.dart';
import 'package:adalearn_core/components/common_components/input_fields/primary_input_field.dart';
import 'package:adalearn_core/adalearn_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneAuthScreen extends StatefulWidget {
  final PageController pageController;
  const PhoneAuthScreen({super.key, required this.pageController});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.w,
            ),
            Center(
                child: Image.asset(
              "./assets/images/student.png",
              height: 200,
            )),
            SizedBox(
              height: 40.w,
            ),
            Text(
              "Enter your Mobile number",
              style: AppStyles.h2,
            ),
            Text(
              "Verify your Management account",
              style: AppStyles.p1,
            ),
            SizedBox(
              height: 20.w,
            ),
            PrimaryInputField(
              prefixText: "+91 ",
              maxLength: 10,
              label: "Mobile Number",
              inputType: TextInputType.phone,
              textEditingController:
                  Get.find<AuthController>().mobileNumberController,
            ),
            SizedBox(
              height: 20.w,
            ),
            PrimaryButton(
                text: "Continue",
                onPressed: () {
                  String? err =
                      Get.find<AuthController>().validateMobileNumber();
                  if (err != null) {
                    // Show UI error
                  } else {
                    Get.find<AuthController>().sendVerificationCode();
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                })
          ],
        ),
      ),
    );
  }
}
