abstract class ProductsStates {}

class ProductsInitial extends ProductsStates {}

class ProductsLoading extends ProductsStates {}

class ProductsSuccess extends ProductsStates {
  String msg = '';
  ProductsSuccess({required this.msg});
}

class ProductsFail extends ProductsStates {
  String msg = '';
  ProductsFail({required this.msg});
}
