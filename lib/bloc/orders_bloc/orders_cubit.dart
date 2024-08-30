import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/models/orders_model.dart';
import 'package:mars/services/api/orders_api.dart';
import 'orders_states.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);
  late OrdersModel ordersModel;
  fetchOrdersData() async {
    emit(OrdersLoading());
    await OrdersApi().fetchOrders().then((response) {
      if (response['success'] == true) {
        ordersModel = OrdersModel.fromJson(response);
        emit(OrdersSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(OrdersFail(msg: response['message']));
      } else {
        OrdersFail(msg: 'No Internet Connection');
      }
    });
  }
}
