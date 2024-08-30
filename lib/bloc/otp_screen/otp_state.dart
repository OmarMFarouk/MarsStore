part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpAnimatedState extends OtpState {
  final bool isAnimated;

  OtpAnimatedState({required this.isAnimated});
}
