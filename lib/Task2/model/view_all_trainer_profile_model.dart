// To parse this JSON data, do
//
//     final getTrainerProfile = getTrainerProfileFromJson(jsonString);

import 'dart:convert';

GetTrainerProfile getTrainerProfileFromJson(String str) => GetTrainerProfile.fromJson(json.decode(str));

String getTrainerProfileToJson(GetTrainerProfile data) => json.encode(data.toJson());

class GetTrainerProfile {
  GetTrainerProfile({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory GetTrainerProfile.fromJson(Map<String, dynamic> json) => GetTrainerProfile(
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
    this.traineeCount,
    this.totalReviewCount,
    this.isSubscribeCount,
    this.isFollowCount,
    this.isFollowRequestCount,
    this.avgRating,
    this.role,
    this.postList,
    this.playlist,
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
  int traineeCount;
  int totalReviewCount;
  int isSubscribeCount;
  int isFollowCount;
  int isFollowRequestCount;
  String avgRating;
  Role role;
  List<PostList> postList;
  List<Playlist> playlist;

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
    traineeCount: json["trainee_count"],
    totalReviewCount: json["total_review_count"],
    isSubscribeCount: json["is_subscribe_count"],
    isFollowCount: json["is_follow_count"],
    isFollowRequestCount: json["is_follow_request_count"],
    avgRating: json["avg_rating"],
    role: Role.fromJson(json["role"]),
    postList: List<PostList>.from(json["post_list"].map((x) => PostList.fromJson(x))),
    playlist: List<Playlist>.from(json["playlist"].map((x) => Playlist.fromJson(x))),
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
    "trainee_count": traineeCount,
    "total_review_count": totalReviewCount,
    "is_subscribe_count": isSubscribeCount,
    "is_follow_count": isFollowCount,
    "is_follow_request_count": isFollowRequestCount,
    "avg_rating": avgRating,
    "role": role.toJson(),
    "post_list": List<dynamic>.from(postList.map((x) => x.toJson())),
    "playlist": List<dynamic>.from(playlist.map((x) => x.toJson())),
  };
}

class Playlist {
  Playlist({
    this.id,
    this.userId,
    this.image,
    this.groupName,
    this.onlyTrainees,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  dynamic image;
  String groupName;
  int onlyTrainees;
  DateTime createdAt;
  DateTime updatedAt;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    groupName: json["group_name"],
    onlyTrainees: json["only_trainees"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "group_name": groupName,
    "only_trainees": onlyTrainees,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
  String coverPhotos;
  String video;
  int isTrainer;
  String height;
  String width;
  DateTime createdAt;
  DateTime updatedAt;

  factory PostList.fromJson(Map<String, dynamic> json) => PostList(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"] == null ? null : json["image"],
    caption: json["caption"],
    myTraineesOnly: json["my_trainees_only"],
    newPlaylistId: json["new_playlist_id"],
    coverPhotos: json["cover_photos"] == null ? null : json["cover_photos"],
    video: json["video"] == null ? null : json["video"],
    isTrainer: json["is_trainer"],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image == null ? null : image,
    "caption": caption,
    "my_trainees_only": myTraineesOnly,
    "new_playlist_id": newPlaylistId,
    "cover_photos": coverPhotos == null ? null : coverPhotos,
    "video": video == null ? null : video,
    "is_trainer": isTrainer,
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Role {
  Role({
    this.id,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String type;
  DateTime createdAt;
  dynamic updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
  };
}
