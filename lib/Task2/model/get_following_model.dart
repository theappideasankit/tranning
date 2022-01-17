// To parse this JSON data, do
//
//     final getFollowingModel = getFollowingModelFromJson(jsonString);

import 'dart:convert';

GetFollowingModel getFollowingModelFromJson(String str) => GetFollowingModel.fromJson(json.decode(str));

String getFollowingModelToJson(GetFollowingModel data) => json.encode(data.toJson());

class GetFollowingModel {
  GetFollowingModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory GetFollowingModel.fromJson(Map<String, dynamic> json) => GetFollowingModel(
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
    this.username,
    this.following,
  });

  int id;
  String username;
  List<Following> following;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    following: List<Following>.from(json["following"].map((x) => Following.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "following": List<dynamic>.from(following.map((x) => x.toJson())),
  };
}

class Following {
  Following({
    this.username,
    this.profile,
    this.rolleId,
    this.pivot,
  });

  String username;
  String profile;
  int rolleId;
  Pivot pivot;

  factory Following.fromJson(Map<String, dynamic> json) => Following(
    username: json["username"],
    profile: json["profile"],
    rolleId: json["rolle_id"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "profile": profile,
    "rolle_id": rolleId,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.fromUserId,
    this.toUserId,
  });

  int fromUserId;
  int toUserId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    fromUserId: json["from_user_id"],
    toUserId: json["to_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "from_user_id": fromUserId,
    "to_user_id": toUserId,
  };
}
