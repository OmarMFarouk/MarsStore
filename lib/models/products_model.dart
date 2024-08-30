import 'dart:convert';

class Product {
  String? id;
  String? productid;
  String? productname;
  String? productsubtitle;
  String? productdescription;
  String? productprice;
  String? productquota;
  List<String>? productimage;
  List<String>? productSized;
  String? productCategory;
  String? dateadded;
  String? bookmarkCount;
  bool? isBookmarked;
  Product(
      {this.id,
      this.productid,
      this.productname,
      this.productsubtitle,
      this.productdescription,
      this.productprice,
      this.productCategory,
      this.productquota,
      this.productimage,
      this.isBookmarked,
      this.bookmarkCount,
      this.productSized,
      this.dateadded});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productid = json['product_id'];
    productname = json['product_name'];
    productsubtitle = json['product_subtitle'];
    productdescription = json['product_description'];
    productprice = json['product_price'];
    productquota = json['product_quota'];
    productimage = jsonDecode(json['product_image']).cast<String>();
    productSized = jsonDecode(json['sizes']).cast<String>();
    productCategory = json['product_category'];
    isBookmarked = json['is_bookmarked'] == '1' ? true : false;
    bookmarkCount = json['bookmark_count'];
    dateadded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productid;
    data['product_name'] = productname;
    data['product_subtitle'] = productsubtitle;
    data['product_description'] = productdescription;
    data['product_price'] = productprice;
    data['product_quota'] = productquota;
    data['product_image'] = productimage;
    data['date_added'] = dateadded;
    return data;
  }
}

class ProductsModel {
  bool? success;
  String? message;
  List<Product>? products;

  ProductsModel({this.success, this.message, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['products'] = products?.map((v) => v.toJson()).toList();
    return data;
  }
}
