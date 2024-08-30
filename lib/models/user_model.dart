/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class UserModel {
  bool? success;
  String? message;
  UserInfo? userinfo;

  UserModel({this.success, this.message, this.userinfo});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userinfo = json['user_info'] != null
        ? UserInfo?.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    data['user_info'] = userinfo!.toJson();
    return data;
  }
}

class UserInfo {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? datecreated;
  String? password;
  String? fcmtoken;
  String? deviceid;
  String? deviceip;
  String? lastaccess;
  String? userAddress;
  String? image;
  String? otp;

  UserInfo(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.datecreated,
      this.password,
      this.fcmtoken,
      this.deviceid,
      this.userAddress,
      this.deviceip,
      this.lastaccess,
      this.image,
      this.otp});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    datecreated = json['date_created'];
    password = json['password'];
    fcmtoken = json['fcm_token'];
    deviceid = json['device_id'];
    deviceip = json['device_ip'];
    lastaccess = json['last_access'];
    userAddress = json['user_address'];
    image = json['image'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['date_created'] = datecreated;
    data['password'] = password;
    data['fcm_token'] = fcmtoken;
    data['device_id'] = deviceid;
    data['device_ip'] = deviceip;
    data['last_access'] = lastaccess;
    data['image'] = image;
    data['otp'] = otp;
    return data;
  }
}
