import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'login_viewmodel.dart';
import 'login_view.form.dart';
import 'dart:io';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: LoginValidators.validateEmail,
  ),
  FormTextField(name: 'password', validator: LoginValidators.validatePassword),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: screenHeight(context),
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 80, bottom: 14),
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
                      SizedBox(height: 40.h),
                      Row(children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Login\n",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Confirm your details to log into your account",
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
                      Column(children: [
                        Container(
                          height: 70.h,
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0XFF1C1A1A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                              border: Border.all(
                                  width: 1.dm, color: const Color(0XFF2E3336))),
                          child: TextFormField(
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofillHints: const [AutofillHints.email],
                            decoration: const InputDecoration(
                              labelText: 'Email address',
                              labelStyle: TextStyle(color: Color(0XFF858585)),
                              hintStyle: TextStyle(color: Color(0XFF858585)),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        if (viewModel.hasEmailValidationMessage &&
                            viewModel.isError) ...[
                          verticalSpaceTiny,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  viewModel.emailValidationMessage!,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        verticalSpace(18.h),
                        Container(
                          height: 70.h,
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0XFF1C1A1A),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                              border: Border.all(
                                  width: 1.dm, color: const Color(0XFF2E3336))),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: viewModel.isPasswordVisible,
                            validator: LoginValidators.validatePassword,
                            autofillHints: const [AutofillHints.password],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Color(0XFF858585)),
                              hintStyle:
                                  const TextStyle(color: Color(0XFF858585)),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  viewModel.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: viewModel
                                    .togglePasswordVisibility, // Toggle visibility
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        if (viewModel.hasPasswordValidationMessage &&
                            viewModel.isError) ...[
                          verticalSpaceTiny,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  viewModel.passwordValidationMessage!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        verticalSpace(18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  viewModel.viewError();
                                  if (!viewModel.hasAnyValidationMessage) {
                                    print("cool");
                                  }
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
                                  minimumSize:
                                      Size(screenWidth(context) * 0.7, 50.h),
                                  backgroundColor: const Color(0xFFB57510),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                )),
                            horizontalSpaceTiny,
                            Container(
                              height: 31.55.h,
                              width: 1.w,
                              color: const Color(0XFFE7E7E7),
                            ),
                            horizontalSpaceTiny,
                            ElevatedButton(
                              onPressed: () {
                                // viewModel.showBottomSheet();
                                viewModel.authenticate();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0XFF1C1A1A), // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      6), // Rounded corners
                                ),
                                padding: const EdgeInsets.all(
                                    10), // Internal padding
                                minimumSize: Size(52.w, 50.h), // Button size
                              ),
                              child: SvgPicture.asset(
                                'images/icons/fingerprint.svg',
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        TextButton(
                            style: ButtonStyle(),
                            onPressed: viewModel.routeToSignup,
                            child: Text("Open an account"))
                      ]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text("I forgot my password")),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/icons/chat.svg',
                              ),
                              horizontalSpaceSmall,
                              Text("Live Chat"),
                            ],
                          ))
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
