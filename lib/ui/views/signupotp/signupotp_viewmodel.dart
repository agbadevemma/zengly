import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';

class SignupotpViewModel extends BaseViewModel implements Initialisable {
  int _secondsRemaining = 32;
  Timer? _timer;
  int get secondsRemaining => _secondsRemaining;
  final _navigationService = locator<NavigationService>();
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;

  SignupotpViewModel() {
    // Initialize defaultPinTheme
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff2E3336)),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    // Initialize focusedPinTheme using defaultPinTheme
    focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: Colors.white, width: 2), // Active border in red
      ),
    );
  }
  void routeBack() {
    _navigationService.back();
  }

  void routeToSetPin() {
    _navigationService.navigateToSetpinView();
  }

  @override
  void initialise() {
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();

          _secondsRemaining = 32; // Reset timer after countdown
          rebuildUi();
        } else {
          _secondsRemaining--;
          rebuildUi();
        }
      },
    );
  }
}
