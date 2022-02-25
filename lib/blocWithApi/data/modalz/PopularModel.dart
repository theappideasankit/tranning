class PopularElement {
  PopularElement({
    this.image,
    this.title,
    this.subtitle,
    this.ratting,
    this.price,
    this.id,
  });

  String image;
  String title;
  String subtitle;
  String ratting;
  String price;
  int id;

  factory PopularElement.fromJson(Map<String, dynamic> json) => PopularElement(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
        ratting: json["ratting"],
        price: json["price"],
        id: json["id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
        "ratting": ratting,
        "price": price,
        "id": id,
      };
}
