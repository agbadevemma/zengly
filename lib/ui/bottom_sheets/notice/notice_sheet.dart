import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zengly/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: double.infinity,
      height: 400.h,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Color(0xff202020),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 4.h,
            width: 32.w,
            decoration: BoxDecoration(
                color: Color(0xffCBD5E1),
                borderRadius: BorderRadius.all(Radius.circular(4.r))),
          ),
          verticalSpaceMedium,
          Text(
            "Sign In With Biometrics",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          verticalSpaceLarge,
          Container(
            height: 96.h,
            width: 96.w,
            decoration: BoxDecoration(
                color: Color(0x1AB57510),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'images/icons/fingerprint2.svg',
              width: 64,
            ),
          ),
          verticalSpaceMedium,
          Text(
            "Scan your fingerprint to login",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF757886)),
          ),
          verticalSpace(20.h),
          ElevatedButton(
              onPressed: () {
    
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth(context) * 0.7, 50.h),
                backgroundColor: const Color(0xFF282828),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Text("Cancel"))
        ],
      ),
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
