class NewUserModel{
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  NewUserModel({
     this.userName,
     this.userEmail,
     this.userPhone,
     this.userPassword,});

  NewUserModel.fromJson(Map<String, dynamic> json) {
//id=json['id'];
    userName=json['userName'];
    userEmail=json['userEmail'];
    userPhone=json['userPhone'];
    userPassword=json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userPhone'] = userPhone;
    data['userPassword'] = userPassword;
    return data;
  }
}
