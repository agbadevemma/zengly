import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'retrievepasswordotp_viewmodel.dart';

class RetrievepasswordotpView
    extends StackedView<RetrievepasswordotpViewModel> {
  const RetrievepasswordotpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RetrievepasswordotpViewModel viewModel,
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
  RetrievepasswordotpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RetrievepasswordotpViewModel();
}
