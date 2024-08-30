import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  bool isAnimated = true;
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>(
      (event, emit) {
        event = OtpAnimatedEvent();

        emit(
          OtpAnimatedState(isAnimated: isAnimated),
        );
      },
    );
  }
}
