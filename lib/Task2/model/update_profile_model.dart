import 'dart:convert';

UpdateProfileResponse updateProfileFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  UpdateProfileResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  UpdateUserProfileModel data;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: UpdateUserProfileModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class UpdateUserProfileModel {
  UpdateUserProfileModel({
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

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileModel(
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
  };
}
