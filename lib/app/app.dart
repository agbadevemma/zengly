import 'package:zengly/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:zengly/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:zengly/ui/views/home/home_view.dart';
import 'package:zengly/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/ui/views/login/login_view.dart';
import 'package:zengly/ui/views/onboarding/onboarding_view.dart';
import 'package:zengly/ui/views/welcome/welcome_view.dart';
import 'package:zengly/ui/views/signup/signup_view.dart';
import 'package:zengly/ui/views/dashboard/dashboard_view.dart';
import 'package:zengly/ui/views/forgot_password/forgot_password_view.dart';
import 'package:zengly/ui/views/setpin/setpin_view.dart';
import 'package:zengly/ui/views/confirmpin/confirmpin_view.dart';
import 'package:zengly/ui/views/signupsuccess/signupsuccess_view.dart';
import 'package:zengly/ui/views/signupotp/signupotp_view.dart';
import 'package:zengly/services/setpin_view_model_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: SetpinView),
    MaterialRoute(page: ConfirmpinView),
    MaterialRoute(page: SignupsuccessView),
    MaterialRoute(page: SignupotpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SetpinViewModelService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
