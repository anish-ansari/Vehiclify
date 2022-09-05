class Nearby {
  int id;
  String namen;
  String linkn;
  String createdAt;
  String updatedAt;

  Nearby({this.id, this.namen, this.linkn, this.createdAt, this.updatedAt});

  Nearby.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namen = json['namen'];
    linkn = json['linkn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namen'] = this.namen;
    data['linkn'] = this.linkn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}