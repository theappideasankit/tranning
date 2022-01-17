// To parse this JSON data, do
//
//     final viewAllProfileModel = viewAllProfileModelFromJson(jsonString);

import 'dart:convert';

ViewAllProfileModel viewAllProfileModelFromJson(String str) => ViewAllProfileModel.fromJson(json.decode(str));

String viewAllProfileModelToJson(ViewAllProfileModel data) => json.encode(data.toJson());

class ViewAllProfileModel {
  ViewAllProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory ViewAllProfileModel.fromJson(Map<String, dynamic> json) => ViewAllProfileModel(
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
    this.followersCount,
    this.followingCount,
    this.isFollowCount,
    this.isFollowRequestCount,
    this.postList,
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
  String otp;
  String bio;
  int isPrivate;
  String lat;
  String lng;
  String fcmToken;
  String deviceType;
  DateTime createdAt;
  DateTime updatedAt;
  int followersCount;
  int followingCount;
  int isFollowCount;
  int isFollowRequestCount;
  List<PostList> postList;

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
    followersCount: json["followers_count"],
    followingCount: json["following_count"],
    isFollowCount: json["is_follow_count"],
    isFollowRequestCount: json["is_follow_request_count"],
    postList: List<PostList>.from(json["post_list"].map((x) => PostList.fromJson(x))),
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
    "followers_count": followersCount,
    "following_count": followingCount,
    "is_follow_count": isFollowCount,
    "is_follow_request_count": isFollowRequestCount,
    "post_list": List<dynamic>.from(postList.map((x) => x.toJson())),
  };
}

class PostList {
  PostList({
    this.id,
    this.userId,
    this.image,
    this.caption,
    this.myTraineesOnly,
    this.newPlaylistId,
    this.coverPhotos,
    this.video,
    this.isTrainer,
    this.height,
    this.width,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String image;
  String caption;
  int myTraineesOnly;
  int newPlaylistId;
  dynamic coverPhotos;
  dynamic video;
  int isTrainer;
  String height;
  String width;
  DateTime createdAt;
  DateTime updatedAt;

  factory PostList.fromJson(Map<String, dynamic> json) => PostList(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    caption: json["caption"],
    myTraineesOnly: json["my_trainees_only"],
    newPlaylistId: json["new_playlist_id"],
    coverPhotos: json["cover_photos"],
    video: json["video"],
    isTrainer: json["is_trainer"],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "caption": caption,
    "my_trainees_only": myTraineesOnly,
    "new_playlist_id": newPlaylistId,
    "cover_photos": coverPhotos,
    "video": video,
    "is_trainer": isTrainer,
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
