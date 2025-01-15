import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Image.asset(
            "images/splashlogos/logo.png",
            scale: 0.8,
          ),
          ElevatedButton(onPressed: (){}, child: Text("Login"))
        ],
      ),
    ));
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
