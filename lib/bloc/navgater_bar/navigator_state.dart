part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorBarState {}

class NavigatorInitial extends NavigatorBarState {}

class TransitionState extends NavigatorBarState {
  final int currenIndex;
  final Future<void> hapticFeedback;

  TransitionState({
    required this.hapticFeedback,
    required this.currenIndex,
  });
}
