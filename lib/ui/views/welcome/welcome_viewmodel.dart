import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  dynamic get nagativateToLogin => _navigationService.navigateToLoginView();
  dynamic get nagativateToSignup => _navigationService.navigateToSignupView();
}
