import 'dart:convert';

ViewProfileResponse viewResponseFromJson(String str) =>
    ViewProfileResponse.fromJson(json.decode(str));

/*
class ViewProfileModel {
  String email;
  String password;
  String token;


  ViewProfileModel({
    this.email,
    this.password,
    this.token
  });

  ViewProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    var fcmtoken;
    FirebaseMessaging.instance.getToken().then((fcmToken) {
      fcmtoken=fcmToken  ;
    });
    Map<String, dynamic> map = {
      'username': email.trim(),
      'password': password.trim(),
      'fcm_token': fcmtoken.toString().trim(),
      'device_type'
          : Platform.isAndroid ? "android" : "ios",
    };
    return
      map;
  }
}

class ViewProfileResponse {
  int code;
  String message;

  ViewProfileResponse({this.code, this.message});

  ViewProfileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
*/
class ViewProfileResponse {

  static List<Data> dataa;

  String status;
  String message;
  int code;
  Data data;

  ViewProfileResponse({this.status, this.message, this.code, this.data});

  ViewProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String apiToken;
  String username;
  String phoneNo;
  int rolleId;
  String email;
  Null emailVerifiedAt;
  Null twoFactorSecret;
  Null twoFactorRecoveryCodes;
  String profile;
  String googleId;
  String facebookId;
  String appId;
  Null quickBoxId;
  Null otp;
  String bio;
  int isPrivate;
  String lat;
  String lng;
  String fcmToken;
  String deviceType;
  String createdAt;
  String updatedAt;
  int followersCount;
  int followingCount;
  int isFollowCount;
  int isFollowRequestCount;
  List<Null> postList;

  Data(
      {this.id,
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
        this.followersCount,
        this.followingCount,
        this.isFollowCount,
        this.isFollowRequestCount,
        this.postList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiToken = json['api_token'];
    username = json['username'];
    phoneNo = json['phone_no'];
    rolleId = json['rolle_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    profile = json['profile'];
    googleId = json['google_id'];
    facebookId = json['facebook_id'];
    appId = json['app_id'];
    quickBoxId = json['quick_box_id'];
    otp = json['otp'];
    bio = json['bio'];
    isPrivate = json['is_private'];
    lat = json['lat'];
    lng = json['lng'];
    fcmToken = json['fcm_token'];
    deviceType = json['device_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    isFollowCount = json['is_follow_count'];
    isFollowRequestCount = json['is_follow_request_count'];
    if (json['post_list'] != null) {
      postList = List<Null>();
      json['post_list'].forEach((v) {
        postList.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['api_token'] = this.apiToken;
    data['username'] = this.username;
    data['phone_no'] = this.phoneNo;
    data['rolle_id'] = this.rolleId;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['profile'] = this.profile;
    data['google_id'] = this.googleId;
    data['facebook_id'] = this.facebookId;
    data['app_id'] = this.appId;
    data['quick_box_id'] = this.quickBoxId;
    data['otp'] = this.otp;
    data['bio'] = this.bio;
    data['is_private'] = this.isPrivate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['fcm_token'] = this.fcmToken;
    data['device_type'] = this.deviceType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['is_follow_count'] = this.isFollowCount;
    data['is_follow_request_count'] = this.isFollowRequestCount;
    if (this.postList != null) {
      data['post_list'] = this.postList.map((v) => toJson()).toList();
    }
    return data;
  }
}

