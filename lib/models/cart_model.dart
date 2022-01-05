import 'package:day1/core/store.dart';
import 'package:day1/models/productmodel.dart';
import 'package:velocity_x/velocity_x.dart';

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
      _productListsIds.map((id) => _products.getById(id)).toList();

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

class AddMutation extends VxMutation<MyStore> {
  final ProductModels products;

  AddMutation(this.products);

  @override
  perform() {
    store.cartModel._productListsIds.add(products.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final ProductModels products;
  RemoveMutation(this.products);
  @override
  perform() {
    store.cartModel._productListsIds.remove(products.id);
  }
}