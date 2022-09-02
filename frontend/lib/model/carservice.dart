class CarService {
  int id;
  String carsername;
  String carseraddress;
  String carserlocation;
  String carserphoneno;
  int carcategoryId;
  String createdAt;
  String updatedAt;

  CarService(
      {this.id,
        this.carsername,
        this.carseraddress,
        this.carserlocation,
        this.carserphoneno,
        this.carcategoryId,
        this.createdAt,
        this.updatedAt});

  CarService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carsername = json['carsername'];
    carseraddress = json['carseraddress'];
    carserlocation = json['carserlocation'];
    carserphoneno = json['carserphoneno'];
    carcategoryId = json['carcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['carsername'] = this.carsername;
    data['carseraddress'] = this.carseraddress;
    data['carserlocation'] = this.carserlocation;
    data['carserphoneno'] = this.carserphoneno;
    data['carcategory_id'] = this.carcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

