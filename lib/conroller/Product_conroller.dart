import 'package:get/get.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/model/Product_model.dart';

class Productconroller extends GetxController {
  Productmodel? Products;
  RxList<Productmodel> productlist = <Productmodel>[].obs;
  RxList favtproduct = [].obs;

  fetchproduct() async {
    Products = await AppServer().showProduct();
    productlist.add(Products!);
    refresh();
  }
}
