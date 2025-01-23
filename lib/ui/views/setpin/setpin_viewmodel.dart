import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:zengly/ui/views/confirmpin/confirmpin_view.dart';

class SetpinViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final int pinLength = 4;
  String enteredPin = "";

  void routeBack() {
    _navigationService.back();
  }

  void routeToConfirm() {
    _navigationService.navigateTo(Routes.confirmpinView, arguments: enteredPin);
  }

  void onNumberPressed(String number) {
    if (enteredPin.length < pinLength) {
      enteredPin += number;
      rebuildUi();
    }
  }

  void onDeletePressed() {
    if (enteredPin.isNotEmpty) {
      enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      rebuildUi();
    }
  }
}
