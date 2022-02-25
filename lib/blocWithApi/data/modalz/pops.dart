// To parse this JSON data, do
//
//     final pops = popsFromJson(jsonString);

import 'dart:convert';

Pops popsFromJson(String str) => Pops.fromJson(json.decode(str));

String popsToJson(Pops data) => json.encode(data.toJson());

class Pops {
  Pops({
    this.popular,
  });

  List<Popular> popular;

  factory Pops.fromJson(Map<String, dynamic> json) => Pops(
    popular: List<Popular>.from(json["popular"].map((x) => Popular.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "popular": List<dynamic>.from(popular.map((x) => x.toJson())),
  };
}

class Popular {
  Popular({
    this.image,
    this.title,
    this.subtitle,
    this.price,
    this.id,
  });

  String image;
  String title;
  String subtitle;
  String price;
  int id;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    image: json["image"],
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "id": id,
  };
}
