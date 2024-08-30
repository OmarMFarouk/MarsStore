import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/models/ads_banner_model.dart';

part 'indecatorads_event.dart';
part 'indecatorads_state.dart';

IndecatoradsBloc indecatoradsBloc = IndecatoradsBloc();

class IndecatoradsBloc extends Bloc<IndecatoradsEvent, IndecatoradsState> {
  int value = 0;
  int controller = adsBannerModel.adsBannerList.length - 1;
  int indecatorIndex = 0;
  IndecatoradsBloc() : super(IndecatoradsInitial()) {
    on<IndecatoradsEvent>(
      (event, emit) {
        event = IndecatorAdsOnChenge();
        emit(
          IndecatorAdsContollState(
            conrollrIndex: controller == value,
            indecatorIndex: indecatorIndex,
          ),
        );
      },
    );
  }
}
