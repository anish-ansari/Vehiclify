class Bike {
  int id;
  String btitle;
  String bdescription;
  String bimage;
  String createdAt;
  String updatedAt;

  Bike(
      {this.id,
        this.btitle,
        this.bdescription,
        this.bimage,
        this.createdAt,
        this.updatedAt});

  Bike.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    btitle = json['btitle'];
    bdescription = json['bdescription'];
    bimage = json['bimage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['btitle'] = this.btitle;
    data['bdescription'] = this.bdescription;
    data['bimage'] = this.bimage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}