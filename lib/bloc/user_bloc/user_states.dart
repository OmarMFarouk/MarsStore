abstract class UserStates {}

class UserInitial extends UserStates {}

class UserLoading extends UserStates {}

class UserSuccess extends UserStates {
  String msg = '';
  UserSuccess({required this.msg});
}

class UserFail extends UserStates {
  String msg = '';
  UserFail({required this.msg});
}
