part of 'onbording_bloc.dart';

abstract class OnbordingState {}

class OnbordingInitial extends OnbordingState {}

class OnbordingContollState extends OnbordingState {
  final bool conrollrIndex;
  final int indecatorIndex;

  OnbordingContollState({
    required this.conrollrIndex,
    required this.indecatorIndex,
  });
}
