import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'retrievepassword_viewmodel.dart';

class RetrievepasswordView extends StackedView<RetrievepasswordViewModel> {
  const RetrievepasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RetrievepasswordViewModel viewModel,
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
  RetrievepasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RetrievepasswordViewModel();
}
