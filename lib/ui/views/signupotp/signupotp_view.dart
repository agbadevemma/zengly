import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  SignupotpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupotpViewModel();
}
