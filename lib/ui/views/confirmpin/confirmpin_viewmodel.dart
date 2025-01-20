import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:zengly/ui/views/setpin/setpin_viewmodel.dart';

class ConfirmpinViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _setPinViewModel = locator<SetpinViewModel>();

  void nextPage() {}

  final int pinLength = 4;
  String enteredPin = "";

  void routeBack() {
    _navigationService.back();
  }

  void routeToConfirm() {
    _navigationService.navigateToConfirmpinView();
  }

  void onNumberPressed(String number, BuildContext context) {
    if (enteredPin.length < pinLength) {
      enteredPin += number;
      rebuildUi();
    }

    // Check if PIN entry is complete
    if (enteredPin.length == pinLength) {
      // Process PIN (e.g., validation or confirmation)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PIN Set: $enteredPin")),
      );
    }
  }

  void onDeletePressed() {
    if (enteredPin.isNotEmpty) {
      enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      rebuildUi();
    }
  }
}
