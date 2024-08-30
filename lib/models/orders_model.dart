class Order {
  String? orderid;
  List<OrderItem?>? orderitems;
  String? totalprice;
  String? totalquantity;
  String? useremail;
  String? userphone;
  String? useraddress;
  String? orderstatus;
  String? orderdatecreated;
  String? orderdatemodified;
  String? userlocation;

  Order(
      {this.orderid,
      this.orderitems,
      this.totalprice,
      this.totalquantity,
      this.useremail,
      this.userphone,
      this.useraddress,
      this.orderstatus,
      this.orderdatecreated,
      this.orderdatemodified,
      this.userlocation});

  Order.fromJson(Map<String, dynamic> json) {
    orderid = json['order_id'];
    if (json['order_items'] != null) {
      orderitems = <OrderItem>[];
      json['order_items'].forEach((v) {
        orderitems!.add(OrderItem.fromJson(v));
      });
    }
    totalprice = json['total_price'];
    totalquantity = json['total_quantity'];
    userphone = json['user_phone'];
    useraddress = json['user_address'];
    orderstatus = json['order_status'];
    orderdatecreated = json['order_date_created'];
    orderdatemodified = json['order_date_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderid;
    data['order_items'] = orderitems?.map((v) => v?.toJson()).toList();
    data['total_price'] = totalprice;
    data['total_quantity'] = totalquantity;
    data['user_email'] = useremail;
    data['user_phone'] = userphone;
    data['user_address'] = useraddress;
    data['order_status'] = orderstatus;
    data['order_date_created'] = orderdatecreated;
    data['order_date_modified'] = orderdatemodified;
    data['user_location'] = userlocation;
    return data;
  }
}

class OrderItem {
  String? id;
  String? productid;
  String? productname;
  String? productprice;
  String? userid;
  String? size;
  String? quantity;
  String? itemdateadded;

  OrderItem(
      {this.id,
      this.productid,
      this.productname,
      this.productprice,
      this.userid,
      this.size,
      this.quantity,
      this.itemdateadded});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productid = json['product_id'];
    productname = json['product_name'];
    productprice = json['product_price'];
    userid = json['user_id'];
    size = json['size'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productid;
    data['product_name'] = productname;
    data['product_price'] = productprice;
    data['user_id'] = userid;
    data['size'] = size;
    data['quantity'] = quantity;
    data['item_date_added'] = itemdateadded;
    return data;
  }
}

class OrdersModel {
  bool? success;
  String? message;
  List<Order?>? orders;

  OrdersModel({this.success, this.message, this.orders});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['orders'] = orders?.map((v) => v?.toJson()).toList();
    return data;
  }
}
