import 'package:flutter_test/flutter_test.dart';
import 'package:zengly/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DashboardViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
