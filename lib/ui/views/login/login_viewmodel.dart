import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.bottomsheets.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:zengly/ui/common/app_colors.dart';
import 'package:zengly/ui/common/app_strings.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool _isError = false;
  bool get isError => _isError;
  void viewError() {
    _isError = true;
    rebuildUi();
  }

  void routeToSignup() {
    _navigationService.navigateToSignupView();
  }

  void routeToDashboard() {
    _navigationService.navigateToSignupView();
  }

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    rebuildUi();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}

class LoginValidators {
  /// Validates if the email is in a proper format.
  static String? validateEmail(String? value) {
    if (value == null) {
      return null;
    }

    // Regular expression for validating email
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  /// Validates if the password meets the criteria.
  static String? validatePassword(String? value) {
    if (value == null) {
      return null;
    }

    return null;
  }
}
