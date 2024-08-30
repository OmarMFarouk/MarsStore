class AppEndPoints {
  // BaseUrl
  static const String endPoint = 'https://komiwall.com/mars/public';

  // Authentication
  static const String loginUser = '$endPoint/auth/login_user.php';
  static const String registerUser = '$endPoint/auth/register_user.php';

  // Products
  static const String showProducts = '$endPoint/products/show_products.php';
  static const String bookMarkProduct =
      '$endPoint/products/bookmark_product.php';
  static const String addProduct = '$endPoint/products/add_product.php';
  static const String updateProduct = '$endPoint/products/update_product.php';

  // Cart
  static const String showCart = '$endPoint/cart/show_cart.php';
  static const String deleteCartItem = '$endPoint/cart/delete_cart_item.php';
  static const String incrementCartItem =
      '$endPoint/cart/increment_cart_item.php';
  static const String addToCart = '$endPoint/cart/add_to_cart.php';

  // Orders
  static const String showOrders = '$endPoint/orders/show_orders.php';
  static const String createOrder = '$endPoint/orders/create_order.php';
  // User
  static const String showUserData = '$endPoint/user/show_user_data.php';
  static const String updateUserData = '$endPoint/user/update_user_data.php';
}
