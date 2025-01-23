import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';

class SignupsuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void routeToLogin() {
    _navigationService.navigateToLoginView();
  }
}
