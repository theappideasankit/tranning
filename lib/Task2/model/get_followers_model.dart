// To parse this JSON data, do
//
//     final getFollowersModel = getFollowersModelFromJson(jsonString);

import 'dart:convert';

GetFollowersModel getFollowersModelFromJson(String str) => GetFollowersModel.fromJson(json.decode(str));

String getFollowersModelToJson(GetFollowersModel data) => json.encode(data.toJson());

class GetFollowersModel {
  GetFollowersModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory GetFollowersModel.fromJson(Map<String, dynamic> json) => GetFollowersModel(
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
    this.followers,
  });

  int id;
  String username;
  List<Follower> followers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    followers: List<Follower>.from(json["followers"].map((x) => Follower.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
  };
}

class Follower {
  Follower({
    this.username,
    this.profile,
    this.rolleId,
    this.pivot,
  });

  String username;
  String profile;
  int rolleId;
  Pivot pivot;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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
    this.toUserId,
    this.fromUserId,
  });

  int toUserId;
  int fromUserId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    toUserId: json["to_user_id"],
    fromUserId: json["from_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "to_user_id": toUserId,
    "from_user_id": fromUserId,
  };
}
