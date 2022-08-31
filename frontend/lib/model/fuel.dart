class Fuel {
  int id;
  String fuelname;
  String price;
  String createdAt;
  String updatedAt;

  Fuel({this.id, this.fuelname, this.price, this.createdAt, this.updatedAt});

  Fuel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fuelname = json['fuelname'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fuelname'] = this.fuelname;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}