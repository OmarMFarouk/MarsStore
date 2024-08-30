import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mood_app_event.dart';
part 'mood_app_state.dart';

class MoodAppBloc extends Bloc<MoodAppEvent, MoodAppState> {
  MoodAppBloc() : super(MoodAppInitial()) {
    on<MoodAppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
