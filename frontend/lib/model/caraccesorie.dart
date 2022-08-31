class CarAccesorie {
  int id;
  String vendorname;
  String linkc;
  String createdAt;
  String updatedAt;

  CarAccesorie(
      {this.id, this.vendorname, this.linkc, this.createdAt, this.updatedAt});

  CarAccesorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorname = json['vendorname'];
    linkc = json['linkc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendorname'] = this.vendorname;
    data['linkc'] = this.linkc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
