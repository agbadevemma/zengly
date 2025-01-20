import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zengly/app/app.locator.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'signup_viewmodel.dart';
import 'dart:io';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: screenHeight(context),
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 50, bottom: 14),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                      Row(children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Sign Up\n",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "Let’s get you started",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ]),
                      verticalSpaceMedium,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 56.h,
                                    padding:
                                        const EdgeInsets.only(left: 20, top: 2),
                                    decoration: BoxDecoration(
                                        color: const Color(0XFF282828),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                        border: Border.all(
                                            width: 1.dm,
                                            color: const Color(0XFF2E3336))),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      style: TextStyle(
                                        fontSize: 14
                                            .sp, // Set the desired font size here
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Legal firstname',
                                        labelStyle: TextStyle(
                                          color: const Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        hintStyle: TextStyle(
                                          color: const Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Expanded(
                                  child: Container(
                                    height: 56.h,
                                    padding:
                                        const EdgeInsets.only(left: 20, top: 2),
                                    decoration: BoxDecoration(
                                        color: const Color(0XFF282828),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                        border: Border.all(
                                            width: 1.dm,
                                            color: const Color(0XFF2E3336))),
                                    child: TextFormField(
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      style: TextStyle(
                                        fontSize: 14
                                            .sp, // Set the desired font size here
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        labelText: 'Legal surname',
                                        labelStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // if (viewModel.hasEmailValidationMessage &&
                            //     viewModel.isError) ...[
                            //   verticalSpaceTiny,
                            //   Row(
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.only(left: 10.0),
                            //         child: Text(
                            //           viewModel.emailValidationMessage!,
                            //           textAlign: TextAlign.start,
                            //           style: const TextStyle(
                            //             color: Colors.red,
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w700,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ],
                            verticalSpace(18.h),
                            Container(
                              height: 56.h,
                              padding: const EdgeInsets.only(left: 20, top: 2),
                              decoration: BoxDecoration(
                                  color: const Color(0XFF282828),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  border: Border.all(
                                      width: 1.dm,
                                      color: const Color(0XFF2E3336))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      style: TextStyle(
                                        fontSize: 14
                                            .sp, // Set the desired font size here
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        labelText: 'Email address',
                                        labelStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Verify",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFB57510)),
                                      ))
                                ],
                              ),
                            ),
                            verticalSpace(18.h),
                            Container(
                              height: 56.h,
                              padding: const EdgeInsets.only(left: 20, top: 2),
                              decoration: BoxDecoration(
                                  color: const Color(0XFF282828),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  border: Border.all(
                                      width: 1.dm,
                                      color: const Color(0XFF2E3336))),
                              child: Row(
                                children: [
                                  IntrinsicWidth(
                                    stepWidth: 0.w,
                                    child: DropdownButtonHideUnderline(
                                      child:
                                          DropdownButton<Map<String, String>>(
                                        isExpanded: false,
                                        menuWidth: 200.w,
                                        value: viewModel.selectedCountry,
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return viewModel.countries
                                              .map((country) {
                                            // What appears in the dropdown button
                                            return Row(
                                              children: [
                                                Text(
                                                  country['emoji']!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp),
                                                ),
                                                horizontalSpaceTiny,
                                                Text(
                                                  country['dial_code']!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp),
                                                ),
                                              ],
                                            );
                                          }).toList();
                                        },
                                        onChanged:
                                            (Map<String, String>? newCountry) {
                                          viewModel.updateCountry(newCountry);
                                        },
                                        items:
                                            viewModel.countries.map((country) {
                                          return DropdownMenuItem<
                                              Map<String, String>>(
                                            value: country,
                                            child: ConstrainedBox(
                                              constraints:
                                                  BoxConstraints(minWidth: 100),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '${country['dial_code']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp),
                                                  ),
                                                  horizontalSpaceTiny,
                                                  Text(
                                                    '${country['emoji']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp),
                                                  ),
                                                  horizontalSpaceTiny,
                                                  Expanded(
                                                    child: Text(
                                                      ' ${country['name']} ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      style: TextStyle(
                                        fontSize: 14
                                            .sp, // Set the desired font size here
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        labelStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Color(0XFF858585),
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Verify",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFB57510)),
                                      ))
                                ],
                              ),
                            ),
                            verticalSpace(18.h),
                            Container(
                              height: 56.h,
                              padding: const EdgeInsets.only(left: 20, top: 2),
                              decoration: BoxDecoration(
                                  color: const Color(0XFF282828),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  border: Border.all(
                                      width: 1.dm,
                                      color: const Color(0XFF2E3336))),
                              child: TextFormField(
                                autofillHints: const [AutofillHints.password],
                                style: TextStyle(
                                  fontSize:
                                      14.sp, // Set the desired font size here
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: 'Choose a password',
                                  labelStyle: TextStyle(
                                    color: Color(0XFF858585),
                                    fontSize: 14.sp,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Color(0XFF858585),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            verticalSpace(4.h),
                            Text(
                              "Password must be at least 6 characters",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff858585)),
                            ),
                            verticalSpace(18.h),
                            Container(
                              height: 56.h,
                              padding: const EdgeInsets.only(left: 20, top: 2),
                              decoration: BoxDecoration(
                                  color: const Color(0XFF282828),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  border: Border.all(
                                      width: 1.dm,
                                      color: const Color(0XFF2E3336))),
                              child: TextFormField(
                                autofillHints: const [AutofillHints.password],
                                style: TextStyle(
                                  fontSize:
                                      14.sp, // Set the desired font size here
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: 'Confirm password',
                                  labelStyle: TextStyle(
                                    color: Color(0XFF858585),
                                    fontSize: 14.sp,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Color(0XFF858585),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),

                            verticalSpace(22.h),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    viewModel.checkBox();
                                  },
                                  child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: viewModel.isChecked
                                          ? const Color(0xFFB57510)
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Color(0xFF2E3336), width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: viewModel.isChecked
                                        ? Icon(
                                            Icons.check,
                                            size: 18,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Expanded(
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "By Opening an account, you accept our",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 12.sp),
                                    ),
                                    TextSpan(
                                      text: " Terms of Service",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 12.sp),
                                    ),
                                    TextSpan(
                                      text: " and",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 12.sp),
                                    ),
                                    TextSpan(
                                      text: " Privacy Policy.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 12.sp),
                                    ),
                                  ])),
                                )
                              ],
                            ),
                            verticalSpaceSmall,
                            ElevatedButton(
                                onPressed: viewModel.navigateToSetPin,
                                child: Text(
                                  "Open Account",
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
                            horizontalSpaceTiny,
                          ]),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/icons/chat.svg',
                          ),
                          horizontalSpaceSmall,
                          Text(
                            "Live Chat",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
