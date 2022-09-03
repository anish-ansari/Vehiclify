class CarMarketModel {
  int id;
  String vcname;
  String vcimage;
  String vccolor;
  String vcdisplacement;
  String vcpower;
  String vctorque;
  String vctyre;
  String vcprice;
  String vcvarient;
  String vctransmission;
  String vcdimension;
  String vcbooknow;
  int carmarcategoryId;
  String createdAt;
  String updatedAt;

  CarMarketModel(
      {this.id,
        this.vcname,
        this.vcimage,
        this.vccolor,
        this.vcdisplacement,
        this.vcpower,
        this.vctorque,
        this.vctyre,
        this.vcprice,
        this.vcvarient,
        this.vctransmission,
        this.vcdimension,
        this.vcbooknow,
        this.carmarcategoryId,
        this.createdAt,
        this.updatedAt});

  CarMarketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vcname = json['vcname'];
    vcimage = json['vcimage'];
    vccolor = json['vccolor'];
    vcdisplacement = json['vcdisplacement'];
    vcpower = json['vcpower'];
    vctorque = json['vctorque'];
    vctyre = json['vctyre'];
    vcprice = json['vcprice'];
    vcvarient = json['vcvarient'];
    vctransmission = json['vctransmission'];
    vcdimension = json['vcdimension'];
    vcbooknow = json['vcbooknow'];
    carmarcategoryId = json['carmarcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vcname'] = this.vcname;
    data['vcimage'] = this.vcimage;
    data['vccolor'] = this.vccolor;
    data['vcdisplacement'] = this.vcdisplacement;
    data['vcpower'] = this.vcpower;
    data['vctorque'] = this.vctorque;
    data['vctyre'] = this.vctyre;
    data['vcprice'] = this.vcprice;
    data['vcvarient'] = this.vcvarient;
    data['vctransmission'] = this.vctransmission;
    data['vcdimension'] = this.vcdimension;
    data['vcbooknow'] = this.vcbooknow;
    data['carmarcategory_id'] = this.carmarcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
