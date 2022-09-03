class BikeMarketModel {
  int id;
  String vbname;
  String vbimage;
  String vbcolor;
  String vbdisplacement;
  String vbpower;
  String vbtorque;
  String vbtyre;
  String vbprice;
  String vbvarient;
  String vbtransmission;
  String vbbooknow;
  int bikemarcategoryId;
  String createdAt;
  String updatedAt;

  BikeMarketModel(
      {this.id,
        this.vbname,
        this.vbimage,
        this.vbcolor,
        this.vbdisplacement,
        this.vbpower,
        this.vbtorque,
        this.vbtyre,
        this.vbprice,
        this.vbvarient,
        this.vbtransmission,
        this.vbbooknow,
        this.bikemarcategoryId,
        this.createdAt,
        this.updatedAt});

  BikeMarketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vbname = json['vbname'];
    vbimage = json['vbimage'];
    vbcolor = json['vbcolor'];
    vbdisplacement = json['vbdisplacement'];
    vbpower = json['vbpower'];
    vbtorque = json['vbtorque'];
    vbtyre = json['vbtyre'];
    vbprice = json['vbprice'];
    vbvarient = json['vbvarient'];
    vbtransmission = json['vbtransmission'];
    vbbooknow = json['vbbooknow'];
    bikemarcategoryId = json['bikemarcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vbname'] = this.vbname;
    data['vbimage'] = this.vbimage;
    data['vbcolor'] = this.vbcolor;
    data['vbdisplacement'] = this.vbdisplacement;
    data['vbpower'] = this.vbpower;
    data['vbtorque'] = this.vbtorque;
    data['vbtyre'] = this.vbtyre;
    data['vbprice'] = this.vbprice;
    data['vbvarient'] = this.vbvarient;
    data['vbtransmission'] = this.vbtransmission;
    data['vbbooknow'] = this.vbbooknow;
    data['bikemarcategory_id'] = this.bikemarcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}