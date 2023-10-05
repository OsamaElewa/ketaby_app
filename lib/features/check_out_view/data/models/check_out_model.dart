class CheckOutModel {
  Data? data;
  String? message;
  int? status;

  CheckOutModel({this.data, this.message, this.status});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  int? id;
  User? user;
  String? total;
  List<CartItems>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    total = json['total'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }
}

class User {
  int? userId;
  String? userName;
  String? userEmail;
  String? address;
  String? phone;

  User({this.userId, this.userName, this.userEmail, this.address, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    address = json['address']?? '';
    phone = json['phone']??'';
  }
}

class CartItems {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductPrice;
  int? itemQuantity;
  String? itemTotal;

  CartItems(
      {this.itemId,
        this.itemProductId,
        this.itemProductName,
        this.itemProductPrice,
        this.itemQuantity,
        this.itemTotal});

  CartItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductPrice = json['item_product_price'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }
}