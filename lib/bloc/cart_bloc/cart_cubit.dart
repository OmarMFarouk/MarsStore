import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/orders_bloc/orders_cubit.dart';
import 'package:mars/services/api/orders_api.dart';
import 'package:mars/services/location.dart';
import '../../models/cart_model.dart';
import '../../services/api/Cart_api.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  TextEditingController phoneCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  late CartModel cartModel;
  List orderItems = [];
  fetchCartData() async {
    emit(CartLoading());
    await CartApi().fetchCart().then((response) {
      if (response['success'] == true) {
        cartModel = CartModel.fromJson(response);

        emit(CartSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(CartFail(msg: response['message']));
      } else {
        CartFail(msg: 'No Internet Connection');
      }
    });
  }

  addToCart({required String productId, required String productSize}) async {
    emit(CartLoading());
    await CartApi()
        .addToCart(productId: productId, productSize: productSize)
        .then((response) {
      if (response['success'] == true) {
        fetchCartData();
        emit(CartSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(CartFail(msg: response['message']));
      } else {
        CartFail(msg: 'No Internet Connection');
      }
    });
  }

  deleteCartItem(
      {required String productId, required String productSize}) async {
    emit(CartLoading());
    await CartApi()
        .deleteCartItem(productId: productId, productSize: productSize)
        .then((response) {
      if (response['success'] == true) {
        fetchCartData();
        emit(CartSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(CartFail(msg: response['message']));
      } else {
        CartFail(msg: 'No Internet Connection');
      }
    });
  }

  incrementCartItem(
      {required String productId,
      required String newQuantity,
      required String productSize}) async {
    emit(CartLoading());
    await Future.wait([
      CartApi()
          .incrementCartItem(
              productId: productId,
              newQuantity: newQuantity,
              productSize: productSize)
          .then((response) {
        if (response['success'] == true) {
          fetchCartData();
          emit(CartSuccess(msg: response['message']));
        } else if (response['success'] == false) {
          emit(CartFail(msg: response['message']));
        } else {
          CartFail(msg: 'No Internet Connection');
        }
      })
    ]);
  }

  createOrder(
      {required String totalPrice,
      required String totalQuantity,
      required BuildContext context,
      required List orderItems}) async {
    emit(CartLoading());
    var requestLocation = await LocationService().currentLocation();
    String userLocation =
        '${requestLocation!.latitude},${requestLocation.longitude}';

    await OrdersApi()
        .createOrder(
            userLocation: userLocation,
            userPhone: phoneCont.text,
            userAddress: addressCont.text.trim(),
            orderItems: orderItems,
            totalPrice: totalPrice,
            totalQuantity: totalQuantity)
        .then((response) {
      if (response['success'] == true) {
        fetchCartData();
        BlocProvider.of<OrdersCubit>(context).fetchOrdersData();
        emit(CartSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(CartFail(msg: response['message']));
      } else {
        CartFail(msg: 'No Internet Connection');
      }
    });
  }
}
