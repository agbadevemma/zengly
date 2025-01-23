import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/services.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'signupotp_viewmodel.dart';

class SignupotpView extends StackedView<SignupotpViewModel> {
  const SignupotpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupotpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 50, bottom: 50),
          width: double.infinity,
          height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20.h),
              GestureDetector(
                onTap: viewModel.routeBack,
                child: SvgPicture.asset(
                  'images/icons/union.svg',
                ),
              ),
              verticalSpace(30.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Enter OTP\n",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "We just sent you a one-time password.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              verticalSpace(30.h),
              Pinput(
                length: 6, // Set the number of input fields
                keyboardType: TextInputType.number, // Allow numeric input
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Allow digits only
                onCompleted: (pin) => print(pin),
                defaultPinTheme: viewModel.defaultPinTheme,
                focusedPinTheme: viewModel.focusedPinTheme,
              ),
              verticalSpaceMedium,
              Text(
                "Can’t find your OTP? check email spam folder",
                style: TextStyle(fontSize: 12.sp, color: Color(0xff858585)),
              ),
              verticalSpaceLarge,
              ElevatedButton(
                  onPressed: viewModel.routeToSetPin,
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
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
              verticalSpaceLarge,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: TextButton(
                            onPressed:
                                viewModel.secondsRemaining == 0 ? null : null,
                            child: Text(
                              viewModel.secondsRemaining > 0
                                  ? 'Resend OTP in ${viewModel.secondsRemaining}s'
                                  : 'Resend OTP',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/icons/chat.svg',
                  ),
                  horizontalSpaceSmall,
                  Text(
                    "Live Chat",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignupotpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupotpViewModel();
}
