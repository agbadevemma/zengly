
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, String>>> loadCountries() async {
  final String response = await rootBundle.loadString('assets/data/countries.json');
  final List<dynamic> data = jsonDecode(response);
  return data.map((item) => Map<String, String>.from(item)).toList();
}
