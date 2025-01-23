import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 50, bottom: 14),
        child: Column(
          children: [
            
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
