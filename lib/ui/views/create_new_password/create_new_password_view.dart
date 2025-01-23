import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_new_password_viewmodel.dart';

class CreateNewPasswordView extends StackedView<CreateNewPasswordViewModel> {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateNewPasswordViewModel viewModel,
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
  CreateNewPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateNewPasswordViewModel();
}
