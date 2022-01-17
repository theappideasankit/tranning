// To parse this JSON data, do
//
//     final savePostModel = savePostModelFromJson(jsonString);

import 'dart:convert';

SavePostModel savePostModelFromJson(String str) => SavePostModel.fromJson(json.decode(str));

String savePostModelToJson(SavePostModel data) => json.encode(data.toJson());

class SavePostModel {
  SavePostModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory SavePostModel.fromJson(Map<String, dynamic> json) => SavePostModel(
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
    this.the0,
    this.the1,
    this.isSaveCount,
  });

  The0 the0;
  The0 the1;
  int isSaveCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    the0: The0.fromJson(json["0"]),
    the1: The0.fromJson(json["1"]),
    isSaveCount: json["is_save_count"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0.toJson(),
    "1": the1.toJson(),
    "is_save_count": isSaveCount,
  };
}

class The0 {
  The0({
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

  factory The0.fromJson(Map<String, dynamic> json) => The0(
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
  String coverPhotos;
  String video;
  int isTrainer;
  dynamic height;
  dynamic width;
  DateTime createdAt;
  DateTime updatedAt;

  factory PostInfo.fromJson(Map<String, dynamic> json) => PostInfo(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"] == null ? null : json["image"],
    caption: json["caption"],
    myTraineesOnly: json["my_trainees_only"],
    newPlaylistId: json["new_playlist_id"],
    coverPhotos: json["cover_photos"] == null ? null : json["cover_photos"],
    video: json["video"] == null ? null : json["video"],
    isTrainer: json["is_trainer"],
    height: json["height"],
    width: json["width"],
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
    "height": height,
    "width": width,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
