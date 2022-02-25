// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.category,
  });

  List<CategoryElement> category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    category: List<CategoryElement>.from(json["category"].map((x) => CategoryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
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
