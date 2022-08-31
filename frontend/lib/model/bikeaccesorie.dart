class BikeAccesorie {
  int id;
  String vendor;
  String linkb;
  String createdAt;
  String updatedAt;

  BikeAccesorie(
      {this.id, this.vendor, this.linkb, this.createdAt, this.updatedAt});

  BikeAccesorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendor = json['vendor'];
    linkb = json['linkb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor'] = this.vendor;
    data['linkb'] = this.linkb;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}