class Dotm {
  int id;
  String dtitle;
  String ddescription;
  String dimage;
  String createdAt;
  String updatedAt;

  Dotm(
      {this.id,
        this.dtitle,
        this.ddescription,
        this.dimage,
        this.createdAt,
        this.updatedAt});

  Dotm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dtitle = json['dtitle'];
    ddescription = json['ddescription'];
    dimage = json['dimage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dtitle'] = this.dtitle;
    data['ddescription'] = this.ddescription;
    data['dimage'] = this.dimage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}