import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
part 'navigator_event.dart';
part 'navigator_state.dart';

NavigatorBarBloc blocNavigator = NavigatorBarBloc();

class NavigatorBarBloc extends Bloc<NavigatorEvent, NavigatorBarState> {
  int currenIndex = 0;
  int index = 0;
  NavigatorBarBloc() : super(NavigatorInitial()) {
    on<NavigatorEvent>(
      
      (event, emit) {
        event = TransitionEvent();
        emit(
          TransitionState(
            currenIndex: currenIndex,
            hapticFeedback: HapticFeedback.heavyImpact(),
          ),
        );
      },
    );
  }
}
