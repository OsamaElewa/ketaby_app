class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? liveMode;
  String? secret;

  EphemeralKeyModel(
      {this.id,
        this.object,
        this.associatedObjects,
        this.created,
        this.expires,
        this.liveMode,
        this.secret});

  EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    if (json['associated_objects'] != null) {
      associatedObjects = <AssociatedObjects>[];
      json['associated_objects'].forEach((v) {
        associatedObjects!.add(AssociatedObjects.fromJson(v));
      });
    }
    created = json['created'];
    expires = json['expires'];
    liveMode = json['livemode'];
    secret = json['secret'];
  }
}

class AssociatedObjects {
  String? id;
  String? type;

  AssociatedObjects({this.id, this.type});

  AssociatedObjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }
}