class Car {
  int id;
  String ctitle;
  String cdescription;
  String cimage;
  String createdAt;
  String updatedAt;

  Car(
      {this.id,
        this.ctitle,
        this.cdescription,
        this.cimage,
        this.createdAt,
        this.updatedAt});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ctitle = json['ctitle'];
    cdescription = json['cdescription'];
    cimage = json['cimage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ctitle'] = this.ctitle;
    data['cdescription'] = this.cdescription;
    data['cimage'] = this.cimage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}