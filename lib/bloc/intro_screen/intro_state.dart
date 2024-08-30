part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

class IntroAnimatedLogoState extends IntroState {
  final bool isAnimated;

  IntroAnimatedLogoState({required this.isAnimated});
}
