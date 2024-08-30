// ignore: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/models/onbordind_model.dart';
part 'onbording_event.dart';
part 'onbording_state.dart';

OnbordingBloc onbordingBloc = OnbordingBloc();

class OnbordingBloc extends Bloc<OnbordingEvent, OnbordingState> {
  int value = 0;
  int controller = onbordindModel.onbordeingList.length - 1;
  int indecatorIndex = 0;

  OnbordingBloc() : super(OnbordingInitial()) {
    on<OnbordingEvent>(
      (event, emit) {
        event = OnbordingNextEvent();
        emit(
          OnbordingContollState(
            conrollrIndex: controller == value,
            indecatorIndex: indecatorIndex,
          ),
        );
      },
    );
  }
}
