import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'show_passwerd_event.dart';
part 'show_passwerd_state.dart';

class ShowPasswerdBloc extends Bloc<ShowPasswerdEvent, ShowPasswerdState> {
  bool isSuffixPressed = true;
  ShowPasswerdBloc() : super(ShowPasswerdInitial()) {
    on<ShowPasswerdEvent>(
      (event, emit) {
        if (event is ShowSuffixPressedEvent) {
          isSuffixPressed = false;
          emit(
            ShowSuffixPressedState(valuoBool: isSuffixPressed),
          );
        } else if (event is HideSuffixPressedEvent) {
          isSuffixPressed = true;
          emit(
            ShowSuffixPressedState(valuoBool: isSuffixPressed),
          );
        }
      },
    );
  }
}
