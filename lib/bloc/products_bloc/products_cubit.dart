import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/models/products_model.dart';
import '../../services/api/Products_api.dart';
import 'products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);
  late ProductsModel productsModel;
  fetchProducts() async {
    emit(ProductsLoading());
    await ProductsApi().fetchProducts().then((response) {
      if (response['success'] == true) {
        productsModel = ProductsModel.fromJson(response);
        emit(ProductsSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(ProductsFail(msg: response['message']));
      } else {
        ProductsFail(msg: 'No Internet Connection');
      }
    });
  }

  bookMarkProduct({required String productId}) async {
    emit(ProductsLoading());
    await ProductsApi()
        .bookMarkProduct(productId: productId)
        .then((response) async {
      if (response['success'] == true) {
        await fetchProducts();
        emit(ProductsSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(ProductsFail(msg: response['message']));
      } else {
        ProductsFail(msg: 'No Internet Connection');
      }
    });
  }
}
