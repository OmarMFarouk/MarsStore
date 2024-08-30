part of 'indecatorads_bloc.dart';

@immutable
abstract class IndecatoradsState {}

class IndecatoradsInitial extends IndecatoradsState {}

class IndecatorAdsContollState extends IndecatoradsState {
  final bool conrollrIndex;
  final int indecatorIndex;

  IndecatorAdsContollState({
    required this.conrollrIndex,
    required this.indecatorIndex,
  });
}
