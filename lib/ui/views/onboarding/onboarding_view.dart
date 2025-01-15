import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: viewModel.pageController,
                onPageChanged: (index) => viewModel.setPage(index),
                itemCount: viewModel.onboardingData.length,
                itemBuilder: (context, index) {
                  final page = viewModel.onboardingData[index];
                  return Column(
                    children: [
                      Expanded(child: Image.asset(page['image']!)),
                      Text(
                        page['description']!,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            verticalSpace(40),
            SizedBox(
              height: 210.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          viewModel.onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: viewModel.currentPage == index ? 25 : 8,
                            height: viewModel.currentPage == index ? 10 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              color: viewModel.currentPage == index
                                  ? Colors.white
                                  : const Color(0xff979797),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.currentPage ==
                              viewModel.onboardingData.length - 1) {
                            viewModel.finishOnboarding();
                          } else {
                            viewModel.nextPage();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(156.w, 50.h),
                          backgroundColor: viewModel.currentPage == 2
                              ? const Color(0xFFB57510)
                              : const Color(0xFF282828),
                          side: BorderSide(
                            color: viewModel.currentPage == 2
                                ? const Color(0xFFB57510)
                                : const Color(0xFF2E3336),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        child: const Text("Next"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
