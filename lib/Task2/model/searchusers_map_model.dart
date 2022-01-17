// To parse this JSON data, do
//
//     final searchUsersMap = searchUsersMapFromJson(jsonString);

import 'dart:convert';

SearchUsersMap searchUsersMapFromJson(String str) => SearchUsersMap.fromJson(json.decode(str));

String searchUsersMapToJson(SearchUsersMap data) => json.encode(data.toJson());

class SearchUsersMap {
  SearchUsersMap({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String status;
  String message;
  int code;
  List<Datum> data;

  factory SearchUsersMap.fromJson(Map<String, dynamic> json) => SearchUsersMap(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.username,
    this.profile,
    this.lat,
    this.lng,
    this.distance,
    this.duration,
  });

  int id;
  String username;
  String profile;
  String lat;
  String lng;
  Distance distance;
  Distance duration;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    username: json["username"],
    profile: json["profile"],
    lat: json["lat"],
    lng: json["lng"],
    distance: Distance.fromJson(json["distance"]),
    duration: Distance.fromJson(json["duration"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "profile": profile,
    "lat": lat,
    "lng": lng,
    "distance": distance.toJson(),
    "duration": duration.toJson(),
  };
}

class Distance {
  Distance({
    this.text,
    this.value,
  });

  String text;
  int value;

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
    text: json["text"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "value": value,
  };
}
