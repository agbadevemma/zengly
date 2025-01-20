import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:zengly/app/app.router.dart';

class SignupViewModel extends BaseViewModel implements Initialisable {
  final _navigationService = locator<NavigationService>();
  bool isChecked = false;
  void routeBack() {
    _navigationService.back();
  }

  List<Map<String, String>> countries = [];
  Map<String, String>? selectedCountry;

  @override
  void initialise() {
    loadCountries();
  }

  // Load JSON file
  Future<void> loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/data/countries.json');
    final List<dynamic> data = jsonDecode(response);
    countries = data.map((item) => Map<String, String>.from(item)).toList();
    if (countries.isNotEmpty) {
      selectedCountry = countries.firstWhere(
        (country) => country['name'] == 'Nigeria',
        orElse: () => countries.first,
      );
    }
    rebuildUi();
  }

  void updateCountry(Map<String, String>? newCountry) {
    selectedCountry = newCountry;

    rebuildUi();
  }

  void navigateToSetPin() {
    _navigationService.navigateToSetpinView();
  }

  void checkBox() {
    isChecked = !isChecked;
    rebuildUi();
  }
}
