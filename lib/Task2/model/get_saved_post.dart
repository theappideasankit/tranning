// To parse this JSON data, do
//
//     final getSacedPOst = getSacedPOstFromJson(jsonString);

import 'dart:convert';

GetSavedPost getSacedPOstFromJson(String str) => GetSavedPost.fromJson(json.decode(str));

String getSacedPOstToJson(GetSavedPost data) => json.encode(data.toJson());

class GetSavedPost {
  GetSavedPost({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  List<PostList> data;

  factory GetSavedPost.fromJson(Map<String, dynamic> json) => GetSavedPost(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: List<PostList>.from(json["data"].map((x) => PostList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PostList {
  PostList({
    this.id,
    this.userId,
    this.postId,
    this.createdAt,
    this.updatedAt,
    this.postInfo,
  });

  int id;
  int userId;
  int postId;
  DateTime createdAt;
  DateTime updatedAt;
  List<PostInfo> postInfo;

  factory PostList.fromJson(Map<String, dynamic> json) => PostList(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    postInfo: List<PostInfo>.from(json["post_info"].map((x) => PostInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "post_info": List<dynamic>.from(postInfo.map((x) => x.toJson())),
  };
}

class PostInfo {
  PostInfo({
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

  factory PostInfo.fromJson(Map<String, dynamic> json) => PostInfo(
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
  };
}
