abstract class CartStates {}

class CartInitial extends CartStates {}

class CartLoading extends CartStates {}

class CartSuccess extends CartStates {
  String msg = '';
  CartSuccess({required this.msg});
}

class CartFail extends CartStates {
  String msg = '';
  CartFail({required this.msg});
}
