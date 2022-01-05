import 'dart:convert';

class CatalogModels {
  static List<ProductModels> products;
//get products by id

   ProductModels getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);
   ProductModels getByPosition(int pos) => products[pos];
}

class ProductModels {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  ProductModels({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  });

  ProductModels copyWith({
    int id,
    String name,
    String desc,
    num price,
    String color,
    String image,
  }) {
    return ProductModels(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory ProductModels.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ProductModels(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModels.fromJson(String source) =>
      ProductModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, desc: $desc, price: $price, image: $image, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModels &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
