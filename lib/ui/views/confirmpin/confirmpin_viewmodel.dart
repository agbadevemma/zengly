import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:zengly/ui/views/setpin/setpin_viewmodel.dart';

class ConfirmpinViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void nextPage() {}

  final int pinLength = 4;
  String enteredPin = "";

  void routeBack() {
    _navigationService.back();
  }

  void routeToConfirm(BuildContext context) {
    _navigationService.navigateToConfirmpinView();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (enteredPin.length == 0) {
      toastification.show(
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        description: RichText(
            text: const TextSpan(text: 'Please enter a complete 4-digit PIN.')),
        showProgressBar: false,
        context: context, // optional if you use ToastificationWrapper
        title: Text('An error occured'),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
      );
      return;
    }
    if (enteredPin != args) {
        print('args ${args}');
      toastification.show(
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        description: RichText(
            text: const TextSpan(text: 'PIN mistach')),
        showProgressBar: false,
        context: context,
        title: Text('An error occured'),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
      );
      
       return;
    }
    _navigationService.navigateToSignupsuccessView();
  
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
