import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.bottomsheets.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:zengly/ui/common/app_strings.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final LocalAuthentication _localAuth = LocalAuthentication();
  String _authorized = "Not Authorized";
  String get authorized => _authorized;

  Future<void> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      print(isAuthenticated);
    } catch (e) {
      print(e);
    }
    _authorized = isAuthenticated ? "Authorized" : "Not Authorized";
    rebuildUi();
  }

  bool _isError = false;
  bool get isError => _isError;
  void viewError() {
    _isError = true;
    rebuildUi();
  }

  void routeBack() {
    _navigationService.back();
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
    if (value.isEmpty) {
      return 'Email is required.';
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
    if (value.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }
}
