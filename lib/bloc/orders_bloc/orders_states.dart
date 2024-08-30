abstract class OrdersStates {}

class OrdersInitial extends OrdersStates {}

class OrdersLoading extends OrdersStates {}

class OrdersSuccess extends OrdersStates {
  String msg = '';
  OrdersSuccess({required this.msg});
}

class OrdersFail extends OrdersStates {
  String msg = '';
  OrdersFail({required this.msg});
}
