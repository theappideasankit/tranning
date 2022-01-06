
import 'package:day1/App1/models/cart_model.dart';
import 'package:day1/App1/models/productmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModels products;
  CartModel cartModel;

  MyStore() {
    products = CatalogModels();
    cartModel = CartModel();

    cartModel.products = products;
  }
}
