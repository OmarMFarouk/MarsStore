part of 'show_passwerd_bloc.dart';

@immutable
abstract class ShowPasswerdState {}

class ShowPasswerdInitial extends ShowPasswerdState {}

class ShowSuffixPressedState extends ShowPasswerdState {
  final bool valuoBool;

  ShowSuffixPressedState({required this.valuoBool});
}

