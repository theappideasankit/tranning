// To parse this JSON data, do
//
//     final traineeList = traineeListFromJson(jsonString);

import 'dart:convert';

GetTraineeListModel traineeListFromJson(String str) => GetTraineeListModel.fromJson(json.decode(str));

String traineeListToJson(GetTraineeListModel data) => json.encode(data.toJson());

class GetTraineeListModel {
  GetTraineeListModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory GetTraineeListModel.fromJson(Map<String, dynamic> json) => GetTraineeListModel(
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
    this.subscriber,
  });

  int id;
  String username;
  List<Subscriber> subscriber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    subscriber: List<Subscriber>.from(json["subscriber"].map((x) => Subscriber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "subscriber": List<dynamic>.from(subscriber.map((x) => x.toJson())),
  };
}

class Subscriber {
  Subscriber({
    this.username,
    this.profile,
    this.pivot,
  });

  String username;
  String profile;
  Pivot pivot;

  factory Subscriber.fromJson(Map<String, dynamic> json) => Subscriber(
    username: json["username"],
    profile: json["profile"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "profile": profile,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.trainerUserId,
    this.userId,
  });

  int trainerUserId;
  int userId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    trainerUserId: json["trainer_user_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "trainer_user_id": trainerUserId,
    "user_id": userId,
  };
}
