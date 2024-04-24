class LoginApiRequestModel {
  String? username;
  String? password;

  LoginApiRequestModel({this.username, this.password});

  LoginApiRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}