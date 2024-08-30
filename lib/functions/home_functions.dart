import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/home_screen/indecatorads_bloc.dart';

class HomeFunctions {
  bool isLastPage = false;
  int indecatorIndex = 0;
  PageController pageController = PageController();
  void onChanged(int screenChanged, BuildContext context) {
    context.read<IndecatoradsBloc>().add((IndecatorAdsOnChenge()));
    isLastPage = indecatoradsBloc.controller == screenChanged;
    indecatorIndex = screenChanged;
  }
}

HomeFunctions homeFunctions = HomeFunctions();
