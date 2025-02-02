import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'package:vibration/vibration.dart';
import 'confirmpin_viewmodel.dart';

class ConfirmpinView extends StackedView<ConfirmpinViewModel> {
  const ConfirmpinView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmpinViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 50, bottom: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
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
                    text: "Great! Now Confirm PIN\n",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Create a 4 Digit PIN for all your transactions",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: Color(0xff282828),
                      borderRadius: BorderRadius.all(Radius.circular(100.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      viewModel.pinLength,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 16.0.w,
                        height: 16.0.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < viewModel.enteredPin.length
                              ? Colors.white
                              : Color(0xff979797),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            verticalSpaceLarge,
            // Keypad
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  // Number buttons (1-9, 0, and delete)
                  String buttonText;
                  if (index < 9) {
                    buttonText = "${index + 1}";
                  } else if (index == 9) {
                    buttonText = "";
                  } else if (index == 10) {
                    buttonText = "0";
                  } else {
                    buttonText = "";
                  }

                  return GestureDetector(
                    onTap: () async {
                      //   if (await Vibration.hasVibrator()) {
                      //   Vibration.vibrate();  // Vibrate on tap
                      // }
                      if (index == 9) {
                        viewModel.onDeletePressed();
                      } else if (index == 11) {
                        viewModel.routeToConfirm(context);
                      } else if (buttonText.isNotEmpty) {
                        viewModel.onNumberPressed(buttonText, context);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            index == 11 ? Color(0xffB57510) : Color(0xff282828),
                      ),
                      child: Center(
                        child: index == 9
                            ? SvgPicture.asset(
                                'images/icons/delete.svg',
                              )
                            : index == 11
                                ? SvgPicture.asset(
                                    'images/icons/arrow_forward.svg',
                                  )
                                : Text(
                                    buttonText,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConfirmpinViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConfirmpinViewModel();
}
