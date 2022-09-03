class BikeDealer {
  int id;
  String bikedelname;
  String bikedeladdress;
  String bikedellocation;
  String bikedelphoneno;
  int bikedelcategoryId;
  String createdAt;
  String updatedAt;

  BikeDealer(
      {this.id,
        this.bikedelname,
        this.bikedeladdress,
        this.bikedellocation,
        this.bikedelphoneno,
        this.bikedelcategoryId,
        this.createdAt,
        this.updatedAt});

  BikeDealer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bikedelname = json['bikedelname'];
    bikedeladdress = json['bikedeladdress'];
    bikedellocation = json['bikedellocation'];
    bikedelphoneno = json['bikedelphoneno'];
    bikedelcategoryId = json['bikedelcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bikedelname'] = this.bikedelname;
    data['bikedeladdress'] = this.bikedeladdress;
    data['bikedellocation'] = this.bikedellocation;
    data['bikedelphoneno'] = this.bikedelphoneno;
    data['bikedelcategory_id'] = this.bikedelcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}