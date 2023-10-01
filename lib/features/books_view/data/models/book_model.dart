class BookModel {
  Data? data;
  String? message;
  num? status;

  BookModel({this.data, this.message, this.status});

  BookModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  List<Products>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ?  Links.fromJson(json['links']) : null;
  }

}

class Products {
  num? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  num? priceAfterDiscount;
  num? stock;
  num? bestSeller;
  String? image;
  String? category;

  Products(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.discount,
        this.priceAfterDiscount,
        this.stock,
        this.bestSeller,
        this.image,
        this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
  }
}

class Meta {
  num? total;
  num? perPage;
  num? currentPage;
  num? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}