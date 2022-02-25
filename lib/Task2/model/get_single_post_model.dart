// To parse this JSON data, do
//
//     final getSinglePost = getSinglePostFromJson(jsonString);

import 'dart:convert';

GetSinglePost getSinglePostFromJson(String str) => GetSinglePost.fromJson(json.decode(str));

String getSinglePostToJson(GetSinglePost data) => json.encode(data.toJson());

class GetSinglePost {
  GetSinglePost({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory GetSinglePost.fromJson(Map<String, dynamic> json) => GetSinglePost(
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
    this.isFollowCount,
    this.isSaveCount,
    this.isFollowRequestCount,
    this.userInfo,
    this.likeInfo,
    this.commentInfo,
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
  dynamic height;
  dynamic width;
  DateTime createdAt;
  DateTime updatedAt;
  int isFollowCount;
  int isSaveCount;
  int isFollowRequestCount;
  User userInfo;
  List<LikeInfo> likeInfo;
  List<CommentInfo> commentInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    caption: json["caption"],
    myTraineesOnly: json["my_trainees_only"],
    newPlaylistId: json["new_playlist_id"],
    coverPhotos: json["cover_photos"],
    video: json["video"],
    isTrainer: json["is_trainer"],
    height: json["height"],
    width: json["width"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isFollowCount: json["is_follow_count"],
    isSaveCount: json["is_save_count"],
    isFollowRequestCount: json["is_follow_request_count"],
    userInfo: User.fromJson(json["user_info"]),
    likeInfo: List<LikeInfo>.from(json["like_info"].map((x) => LikeInfo.fromJson(x))),
    commentInfo: List<CommentInfo>.from(json["comment_info"].map((x) => CommentInfo.fromJson(x))),
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
    "height": height,
    "width": width,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_follow_count": isFollowCount,
    "is_save_count": isSaveCount,
    "is_follow_request_count": isFollowRequestCount,
    "user_info": userInfo.toJson(),
    "like_info": List<dynamic>.from(likeInfo.map((x) => x.toJson())),
    "comment_info": List<dynamic>.from(commentInfo.map((x) => x.toJson())),
  };
}

class CommentInfo {
  CommentInfo({
    this.id,
    this.postId,
    this.userId,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.userdetail,
  });

  int id;
  int postId;
  int userId;
  String caption;
  DateTime createdAt;
  DateTime updatedAt;
  User userdetail;

  factory CommentInfo.fromJson(Map<String, dynamic> json) => CommentInfo(
    id: json["id"],
    postId: json["post_id"],
    userId: json["user_id"],
    caption: json["caption"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userdetail: User.fromJson(json["userdetail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "caption": caption,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "userdetail": userdetail.toJson(),
  };
}

class User {
  User({
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
  String otp;
  String bio;
  int isPrivate;
  String lat;
  String lng;
  String fcmToken;
  String deviceType;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    otp: json["otp"] == null ? null : json["otp"],
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
    "otp": otp == null ? null : otp,
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

class LikeInfo {
  LikeInfo({
    this.userId,
    this.postId,
  });

  int userId;
  int postId;

  factory LikeInfo.fromJson(Map<String, dynamic> json) => LikeInfo(
    userId: json["user_id"],
    postId: json["post_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "post_id": postId,
  };
}
