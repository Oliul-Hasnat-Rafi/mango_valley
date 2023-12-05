import 'package:get/get.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/model/Product_model.dart';
import 'package:mango_valley/model/productinfo.dart';

class Productconroller extends GetxController {
  Productmodel? Products;
  RxList<Productmodel> productlist = <Productmodel>[].obs;
  RxList favtproduct = [].obs;

  Productinfo? productinfo;
  RxList<Productinfo> productinfolist = <Productinfo>[].obs;

  fetchproduct() async {
    Products = await AppServer().showProduct();
    productlist.add(Products!);
    refresh();
  }

  proinfo({required int? id}) async {
    productinfo = await AppServer().Productdetail(productid: id);
    productinfolist.add(productinfo!);
    refresh();
  }
}
