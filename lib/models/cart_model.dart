import 'package:day1/models/productmodel.dart';

class CartModel {
  CatalogModels _products;

  //collection of ids - stored IDs products
  final List<int> _productListsIds = [];

  //get products
  CatalogModels get products => _products;

  set products(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _products = newCatalog;
  }

  //get products list
  List<ProductModels> get productss =>
      _productListsIds.map((id) => _products.getById(id));

  // Get total prices
  num get totalPrice =>
      productss.fold(0, (total, current) => total + current.price);

  //add  products

  void add(ProductModels productModels) {
    _productListsIds.add(productModels.id);
  }

  //remove products
  void remove(ProductModels productModels) {
    _productListsIds.remove(productModels.id);
  }
  
}
