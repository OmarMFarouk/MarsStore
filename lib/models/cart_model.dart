import 'dart:convert';

class CartItem {
  String? id;
  String? productid;
  String? productname;
  String? productsubtitle;
  String? productdescription;
  String? productprice;
  String? productquota;
  String? productimage;
  String? productcategory;
  String? dateadded;
  String? bookmarkcount;
  String? productSize;
  String? userid;
  String? quantity;
  String? itemdateadded;

  CartItem(
      {this.id,
      this.productid,
      this.productname,
      // this.productsubtitle,
      // this.productdescription,
      this.productprice,
      // this.productquota,
      this.productimage,
      this.productcategory,
      this.dateadded,
      // this.bookmarkcount,
      this.productSize,
      this.userid,
      this.quantity,
      this.itemdateadded});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productid = json['product_id'];
    productname = json['product_name'];
    // productsubtitle = json['product_subtitle'];
    // productdescription = json['product_description'];
    productprice = json['product_price'];
    // productquota = json['product_quota'];
    productimage = jsonDecode(json['product_image']).cast<String>()[0];
    productcategory = json['product_category'];
    userid = json['user_id'];
    productSize = json['size'];
    quantity = json['quantity'];
    itemdateadded = json['item_date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productid;
    data['product_name'] = productname;
    data['product_price'] = productprice;
    data['user_id'] = userid;
    data['size'] = productSize;
    data['quantity'] = quantity;
    return data;
  }
}

class CartModel {
  bool? success;
  String? message;
  List<CartItem?>? cartitems;

  CartModel({this.success, this.message, this.cartitems});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['cart_items'] != null) {
      cartitems = <CartItem>[];
      json['cart_items'].forEach((v) {
        cartitems!.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['cart_items'] = cartitems?.map((v) => v?.toJson()).toList();
    return data;
  }
}
