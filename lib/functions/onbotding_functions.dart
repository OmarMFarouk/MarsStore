import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/onboeding_screen/onbording_bloc.dart';

class OnbotdingFunctions {
  bool isLastPage = false;
  int indecatorIndex = 0;
  PageController pageController = PageController();

  void onbordingNextButton(final BuildContext context) {
    context.read<OnbordingBloc>().add((OnbordingNextEvent()));

    pageController.nextPage(
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void onChanged(int screenChanged, BuildContext context) {
    context.read<OnbordingBloc>().add((OnbordingNextEvent()));
    isLastPage = onbordingBloc.controller == screenChanged;
    indecatorIndex = screenChanged;
  }

  void skipOnbordingButton() {
    pageController.jumpToPage(onbordingBloc.controller);
  }
}

OnbotdingFunctions onbotdingFunctions = OnbotdingFunctions();
