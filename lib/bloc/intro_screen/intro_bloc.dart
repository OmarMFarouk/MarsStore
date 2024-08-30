import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'intro_event.dart';
part 'intro_state.dart';

IntroBloc introBloc = IntroBloc();

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  bool isAnimated = true;
  IntroBloc() : super(IntroInitial()) {
    on<IntroEvent>(
      (event, emit) {
        event = IntroAnimatedEvent();
        emit(
          IntroAnimatedLogoState(isAnimated: isAnimated),
        );
      },
    );
  }
}
