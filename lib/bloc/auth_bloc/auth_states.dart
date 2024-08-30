abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {
  String msg = '';
  AuthSuccess({required this.msg});
}

class AuthFail extends AuthStates {
  String msg = '';
  AuthFail({required this.msg});
}
