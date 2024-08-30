import 'package:mars/core/icon_app.dart';
import 'package:mars/data/navgator_bat_data.dart';
import 'package:mars/screens/main/home_screen.dart';
import 'package:mars/screens/main/cart_screen.dart';
import 'package:mars/screens/main/setting_screen.dart';
import 'package:mars/screens/main/orders_screen.dart';

NavigatorbarModel navigatorBarModel = NavigatorbarModel();

class NavigatorbarModel {
  List<NavigatorData> navigatorList = [
    NavigatorData(
      svgIcon: iconApp.homeIcon,
      screen: const HomeScreen(),
    ),
    NavigatorData(
      svgIcon: iconApp.shoppingIcon,
      screen: const CartScreen(),
    ),
    NavigatorData(
      svgIcon: iconApp.orderIcon,
      screen: const OrdersScreen(),
    ),
    NavigatorData(
      svgIcon: iconApp.settingsIcon,
      screen: const SettingScreen(),
    ),
  ];
}
