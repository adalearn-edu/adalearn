// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:adalearn_core/constants/private_constants.dart';
import 'package:adalearn_core/controllers/user_session_controller.dart';
import 'package:adalearn_core/datastores/user_data_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppState { SplashScreen, WelcomeScreen, HomeScreen }

class AppController extends GetxController {
  Rx<AppState> _appState = AppState.SplashScreen.obs;
  Rx<AppState> get appState => _appState;

  void updateAppState(AppState appState) {
    _appState.value = appState;
  }

  void initApp() async {
    await _connectToServer();
    _injectDependency();
    await Get.find<UserSession>().fetchAndSetUser();
    // not a fresh app launch
    if (UserDataStore().isLoggedIn) {
      updateAppState(AppState.HomeScreen);
    }
    // fresh launch
    else {
      updateAppState(AppState.WelcomeScreen);
    }
  }

  Future _connectToServer() async {
    try {
      await Supabase.initialize(
        url: PrivateConstants.supabaseProjectUrl,
        anonKey: PrivateConstants.supabaseANONKey,
        authFlowType: AuthFlowType.pkce,
        debug: kDebugMode,
      );
    } catch (e) {
      //
    }
  }

  void _injectDependency() {
    Get.lazyPut<UserSession>(() => UserSession());
  }
}
