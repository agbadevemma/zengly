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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  SignupsuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupsuccessViewModel();
}
