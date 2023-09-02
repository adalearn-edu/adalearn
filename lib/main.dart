import 'package:adalearn/common_controllers/app_controller.dart';
import 'package:adalearn/components/intro/splash_screen.dart';
import 'package:adalearn/components/intro/welcome_screen.dart';
import 'package:adalearn/components/main_app/app_root.dart';
import 'package:adalearn_core/adalearn_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationBase());
  Get.put<AppController>(AppController()).initApp();
}

class ApplicationBase extends StatelessWidget {
  const ApplicationBase({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return GetMaterialApp(
            initialRoute: "/",
            routes: {"/": (context) => const BaseWidget()},
            title: 'Adalearn',
            theme: AppThemeUtil.getApplicationTheme(),
          );
        });
  }
}

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (Get.find<AppController>().appState.value) {
        case AppState.SplashScreen:
          return const SplashScreen();
        case AppState.WelcomeScreen:
          return const WelcomeScreen();
        case AppState.HomeScreen:
          return const AppRoot();
      }
    });
  }
}
