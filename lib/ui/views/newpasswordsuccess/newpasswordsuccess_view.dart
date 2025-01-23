import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'newpasswordsuccess_viewmodel.dart';

class NewpasswordsuccessView extends StackedView<NewpasswordsuccessViewModel> {
  const NewpasswordsuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NewpasswordsuccessViewModel viewModel,
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
  NewpasswordsuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewpasswordsuccessViewModel();
}
