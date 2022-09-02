class BikeService {
  int id;
  String bikesername;
  String bikeseraddress;
  String bikeserlocation;
  String bikeserphoneno;
  int bikecategoryId;
  String createdAt;
  String updatedAt;

  BikeService(
      {this.id,
        this.bikesername,
        this.bikeseraddress,
        this.bikeserlocation,
        this.bikeserphoneno,
        this.bikecategoryId,
        this.createdAt,
        this.updatedAt});

  BikeService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bikesername = json['bikesername'];
    bikeseraddress = json['bikeseraddress'];
    bikeserlocation = json['bikeserlocation'];
    bikeserphoneno = json['bikeserphoneno'];
    bikecategoryId = json['bikecategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bikesername'] = this.bikesername;
    data['bikeseraddress'] = this.bikeseraddress;
    data['bikeserlocation'] = this.bikeserlocation;
    data['bikeserphoneno'] = this.bikeserphoneno;
    data['bikecategory_id'] = this.bikecategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}