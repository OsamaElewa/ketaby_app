class CategoryModel {
  Data? data;
  String? message;
  int? status;

  CategoryModel({this.data, this.message, this.status});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  List<Categories>? categories;
  Meta? meta;
  Links? links;

  Data({this.categories, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
}

class Categories {
  int? id;
  String? name;
  int? productsCount;

  Categories({this.id, this.name, this.productsCount});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

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
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}