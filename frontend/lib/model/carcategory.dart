class CarCategory {
  int id;
  String carcatname;
  String carcaticon;
  String createdAt;
  String updatedAt;

  CarCategory(
      {this.id,
        this.carcatname,
        this.carcaticon,
        this.createdAt,
        this.updatedAt});

  CarCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carcatname = json['carcatname'];
    carcaticon = json['carcaticon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['carcatname'] = this.carcatname;
    data['carcaticon'] = this.carcaticon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}