class BikeCategory {
  int id;
  String bikecatname;
  String bikecaticon;
  String createdAt;
  String updatedAt;

  BikeCategory(
      {this.id,
        this.bikecatname,
        this.bikecaticon,
        this.createdAt,
        this.updatedAt});

  BikeCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bikecatname = json['bikecatname'];
    bikecaticon = json['bikecaticon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bikecatname'] = this.bikecatname;
    data['bikecaticon'] = this.bikecaticon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}