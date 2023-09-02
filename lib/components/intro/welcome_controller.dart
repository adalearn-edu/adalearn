import 'dart:async';

import 'package:flutter/material.dart';

class WelcomeController {
  final PageController welcomePageController = PageController();
  late Timer _timer;

  void scrollPage() {
    int index = 0;
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      index = (index + 1) % 3;
      welcomePageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  void dispose() {
    _timer.cancel();
  }
}
