// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.popular,
    this.category,
  });

  List<Popular> popular;
  List<CategoryElement> category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    popular: List<Popular>.from(json["popular"].map((x) => Popular.fromJson(x))),
    category: List<CategoryElement>.from(json["category"].map((x) => CategoryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "popular": List<dynamic>.from(popular.map((x) => x.toJson())),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class CategoryElement {
  CategoryElement({
    this.image,
    this.title,
    this.id,
  });

  String image;
  String title;
  int id;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
    image: json["image"],
    title: json["title"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "id": id,
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
