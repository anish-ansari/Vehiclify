class Insurance {
  int id;
  String companyname;
  String link;
  String createdAt;
  String updatedAt;

  Insurance(
      {this.id, this.companyname, this.link, this.createdAt, this.updatedAt});

  Insurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyname = json['companyname'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyname'] = this.companyname;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}