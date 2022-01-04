class ProductModel {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String urlImage;
  final String color;

  ProductModel(
      {this.id, this.name, this.desc, this.price, this.urlImage, this.color});
}

class CatalogModel {
  static final products = [
    ProductModel(
        id: "p1",
        name: "poco m2",
        desc: " 6gb , 64gb",
        price: 12000,
        urlImage:
            "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
        color: "blue")
  ];
}
