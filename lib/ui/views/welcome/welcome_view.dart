import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Stack(
        children: [
          Image.asset(
            "images/welcome.gif",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.6), // 10% opacity
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      verticalSpace(150.h),
                      Image.asset(
                        "images/splashlogos/logo.png",
                        scale: 0.8,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        "Your Money, Your Freedom, Your Zengly.",
                        style: TextStyle(
                            fontSize: 14.5.sp, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpaceMedium,
                      ElevatedButton(
                          onPressed: () async {
                            await viewModel.nagativateToLogin();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50.h),
                            backgroundColor: const Color(0xFFB57510),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          )),
                      verticalSpace(30.h),
                      TextButton(
                          onPressed: () async {
                            await viewModel.nagativateToSignup();
                          },
                          child: Text(
                            "Open an account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
