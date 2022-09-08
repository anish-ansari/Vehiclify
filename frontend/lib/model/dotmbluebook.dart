class DotmBluebook {
  int id;
  String dcompanyname;
  String dmodel;
  String dmanufacturedyear;
  String dcylinder;
  String dcc;
  String dchasisno;
  String dengineno;
  String dcolor;
  String dseatcapacity;
  String dfueltype;
  String dboughtfrom;
  String duse;
  String ddrivingarea;
  String drenewdate;
  String dpimage;
  String ddimage;
  String createdAt;
  String updatedAt;

  DotmBluebook(
      {this.id,
        this.dcompanyname,
        this.dmodel,
        this.dmanufacturedyear,
        this.dcylinder,
        this.dcc,
        this.dchasisno,
        this.dengineno,
        this.dcolor,
        this.dseatcapacity,
        this.dfueltype,
        this.dboughtfrom,
        this.duse,
        this.ddrivingarea,
        this.drenewdate,
        this.dpimage,
        this.ddimage,
        this.createdAt,
        this.updatedAt});

  DotmBluebook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dcompanyname = json['dcompanyname'];
    dmodel = json['dmodel'];
    dmanufacturedyear = json['dmanufacturedyear'];
    dcylinder = json['dcylinder'];
    dcc = json['dcc'];
    dchasisno = json['dchasisno'];
    dengineno = json['dengineno'];
    dcolor = json['dcolor'];
    dseatcapacity = json['dseatcapacity'];
    dfueltype = json['dfueltype'];
    dboughtfrom = json['dboughtfrom'];
    duse = json['duse'];
    ddrivingarea = json['ddrivingarea'];
    drenewdate = json['drenewdate'];
    dpimage = json['dpimage'];
    ddimage = json['ddimage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dcompanyname'] = this.dcompanyname;
    data['dmodel'] = this.dmodel;
    data['dmanufacturedyear'] = this.dmanufacturedyear;
    data['dcylinder'] = this.dcylinder;
    data['dcc'] = this.dcc;
    data['dchasisno'] = this.dchasisno;
    data['dengineno'] = this.dengineno;
    data['dcolor'] = this.dcolor;
    data['dseatcapacity'] = this.dseatcapacity;
    data['dfueltype'] = this.dfueltype;
    data['dboughtfrom'] = this.dboughtfrom;
    data['duse'] = this.duse;
    data['ddrivingarea'] = this.ddrivingarea;
    data['drenewdate'] = this.drenewdate;
    data['dpimage'] = this.dpimage;
    data['ddimage'] = this.ddimage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}