import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zengly/ui/common/ui_helpers.dart';

import 'signupsuccess_viewmodel.dart';

class SignupsuccessView extends StackedView<SignupsuccessViewModel> {
  const SignupsuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupsuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 150, bottom: 14),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
              
                 border: Border.all(color: Colors.white),
                  shape: BoxShape.circle
                ),
                child: Image.asset(
                  'images/success.gif',
                  width: 240.w,
                ),
              ),
            ),
            verticalSpaceMedium,
            Text(
              "Voila! ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),
            verticalSpaceMedium,
            Text(
              "Welcome to Zengly—where your money\n vibes with your lifestyle!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xffADADAD)),
            ),
            verticalSpace(60.h),
            ElevatedButton(
                onPressed: viewModel.routeToLogin,
                // ignore: sort_child_properties_last
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
          ],
        ),
      ),
    );
  }

  @override
  SignupsuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupsuccessViewModel();
}
