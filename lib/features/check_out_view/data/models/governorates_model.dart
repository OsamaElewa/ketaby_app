class GovernoratesModel {
  List<Data>? data;
  String? message;
  int? status;

  GovernoratesModel({this.data, this.message, this.status});

  GovernoratesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  int? id;
  String? governorateNameEn;

  Data({this.id, this.governorateNameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }
}
