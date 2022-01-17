import 'dart:convert';

ViewProfileResponse newsModelFromJson(String str) => ViewProfileResponse.fromJson(json.decode(str));

String newsModelToJson(ViewProfileResponse data) => json.encode(data.toJson());



ViewProfileResponse viewProfileResponseFromJson(String str) => ViewProfileResponse.fromJson(json.decode(str));

String viewProfileResponseToJson(ViewProfileResponse data) => json.encode(data.toJson());

class ViewProfileResponse {
  ViewProfileResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory ViewProfileResponse.fromJson(Map<String, dynamic> json) => ViewProfileResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.apiToken,
    this.username,
    this.phoneNo,
    this.rolleId,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.profile,
    this.googleId,
    this.facebookId,
    this.appId,
    this.quickBoxId,
    this.otp,
    this.bio,
    this.isPrivate,
    this.lat,
    this.lng,
    this.fcmToken,
    this.deviceType,
    this.createdAt,
    this.updatedAt,
    this.myTrainerCount,
    this.followersCount,
    this.followingCount,
    this.postList,
    this.settingInfo,
  });

  int id;
  String apiToken;
  String username;
  String phoneNo;
  int rolleId;
  String email;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  String profile;
  String googleId;
  String facebookId;
  String appId;
  dynamic quickBoxId;
  dynamic otp;
  String bio;
  int isPrivate;
  String lat;
  String lng;
  String fcmToken;
  String deviceType;
  DateTime createdAt;
  DateTime updatedAt;
  int myTrainerCount;
  int followersCount;
  int followingCount;
  List<dynamic> postList;
  dynamic settingInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    apiToken: json["api_token"],
    username: json["username"],
    phoneNo: json["phone_no"],
    rolleId: json["rolle_id"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    twoFactorSecret: json["two_factor_secret"],
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
    profile: json["profile"],
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    appId: json["app_id"],
    quickBoxId: json["quick_box_id"],
    otp: json["otp"],
    bio: json["bio"],
    isPrivate: json["is_private"],
    lat: json["lat"],
    lng: json["lng"],
    fcmToken: json["fcm_token"],
    deviceType: json["device_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    myTrainerCount: json["my_trainer_count"],
    followersCount: json["followers_count"],
    followingCount: json["following_count"],
    postList: List<dynamic>.from(json["post_list"].map((x) => x)),
    settingInfo: json["setting_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "api_token": apiToken,
    "username": username,
    "phone_no": phoneNo,
    "rolle_id": rolleId,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "two_factor_secret": twoFactorSecret,
    "two_factor_recovery_codes": twoFactorRecoveryCodes,
    "profile": profile,
    "google_id": googleId,
    "facebook_id": facebookId,
    "app_id": appId,
    "quick_box_id": quickBoxId,
    "otp": otp,
    "bio": bio,
    "is_private": isPrivate,
    "lat": lat,
    "lng": lng,
    "fcm_token": fcmToken,
    "device_type": deviceType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "my_trainer_count": myTrainerCount,
    "followers_count": followersCount,
    "following_count": followingCount,
    "post_list": List<dynamic>.from(postList.map((x) => x)),
    "setting_info": settingInfo,
  };
}
