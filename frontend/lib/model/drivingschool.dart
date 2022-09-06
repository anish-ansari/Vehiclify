class DrivingSchool {
  int id;
  String drivingschoolname;
  String drivingschooladdress;
  String drivingschoollocation;
  String drivingschoolphoneno;
  String createdAt;
  String updatedAt;

  DrivingSchool(
      {this.id,
        this.drivingschoolname,
        this.drivingschooladdress,
        this.drivingschoollocation,
        this.drivingschoolphoneno,
        this.createdAt,
        this.updatedAt});

  DrivingSchool.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drivingschoolname = json['drivingschoolname'];
    drivingschooladdress = json['drivingschooladdress'];
    drivingschoollocation = json['drivingschoollocation'];
    drivingschoolphoneno = json['drivingschoolphoneno'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['drivingschoolname'] = this.drivingschoolname;
    data['drivingschooladdress'] = this.drivingschooladdress;
    data['drivingschoollocation'] = this.drivingschoollocation;
    data['drivingschoolphoneno'] = this.drivingschoolphoneno;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}