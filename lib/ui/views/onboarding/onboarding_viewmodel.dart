import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  final _navigationService = locator<NavigationService>();
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  dynamic get finishOnboarding => _navigationService.navigateToWelcomeView();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'images/onboarding/img1.png',
      'description':
          'Fast, secure transfers you can trust—Zengly has you covered.',
    },
    {
      'image': 'images/onboarding/img2.png',
      'description':
          'Split bills among friends —effortless group payments made simple.',
    },
    {
      'image': 'images/onboarding/img3.png',
      'description':
          'Save smarter, reach goals faster—tailored tools to grow your wealth.',
    },
  ];
}
