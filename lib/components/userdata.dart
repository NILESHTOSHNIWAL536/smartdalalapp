class userDetails {
  String? sId;
  String? shopName;
  String? shopAddress;
  String? adminName;
  int? contactNo1;
  String? emailadress;
  String? password;
  int? iV;

  userDetails(
      {this.sId,
      this.shopName,
      this.shopAddress,
      this.adminName,
      this.contactNo1,
      this.emailadress,
      this.password,
      this.iV});

  userDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    adminName = json['admin_name'];
    contactNo1 = json['contactNo1'];
    emailadress = json['emailadress'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['shop_name'] = this.shopName;
    data['shop_address'] = this.shopAddress;
    data['admin_name'] = this.adminName;
    data['contactNo1'] = this.contactNo1;
    data['emailadress'] = this.emailadress;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}
