import 'package:flutter/material.dart';
import 'package:zengly/app/app.bottomsheets.dart';
import 'package:zengly/app/app.dialogs.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xff202020),
            colorScheme: ColorScheme.fromSwatch(
              cardColor: Colors.white,
            ).copyWith(secondary: Colors.orange, primary: Colors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff282828),
                foregroundColor: Colors.white,
              ),
            ),
            scaffoldBackgroundColor: const Color(0xff202020),
            textTheme:
                GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
              fontSizeFactor: 1.sp,
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
          ),
          initialRoute: Routes.loginView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        );
      },
    );
  }
}
