class CarDealer {
  int id;
  String cardelname;
  String cardeladdress;
  String cardellocation;
  String cardelphoneno;
  int cardelcategoryId;
  String createdAt;
  String updatedAt;

  CarDealer(
      {this.id,
        this.cardelname,
        this.cardeladdress,
        this.cardellocation,
        this.cardelphoneno,
        this.cardelcategoryId,
        this.createdAt,
        this.updatedAt});

  CarDealer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardelname = json['cardelname'];
    cardeladdress = json['cardeladdress'];
    cardellocation = json['cardellocation'];
    cardelphoneno = json['cardelphoneno'];
    cardelcategoryId = json['cardelcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cardelname'] = this.cardelname;
    data['cardeladdress'] = this.cardeladdress;
    data['cardellocation'] = this.cardellocation;
    data['cardelphoneno'] = this.cardelphoneno;
    data['cardelcategory_id'] = this.cardelcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}