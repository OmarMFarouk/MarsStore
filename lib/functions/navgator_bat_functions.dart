import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';

class NavgatorBatFunctions {
  void navigtorButton(BuildContext context, int index) {
    context.read<NavigatorBarBloc>().add((TransitionEvent()));
    blocNavigator.currenIndex = index;
  }
}

NavgatorBatFunctions navgatorBatFunctions = NavgatorBatFunctions();
