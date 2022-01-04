class ProductModel {
  final String? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? urlImage;
  final String? color;

  ProductModel(
      {this.id, this.name, this.desc, this.price, this.urlImage, this.color});
}

final products = [
  ProductModel(
      id: "p1",
      name: "poco m2",
      desc: " 6gb , 64gb",
      price: 12000,
      urlImage: "",
      color: "blue")
];
