import 'package:flutter_test/flutter_test.dart';
import 'package:zengly/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CreateNewPasswordViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
