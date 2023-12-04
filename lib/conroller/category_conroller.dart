import 'package:get/get.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/model/CategoryModel.dart';

class Categoryconroller extends GetxController {
  CategoryModel? category;

  RxList<CategoryModel> categorylist = <CategoryModel>[].obs;

  fetchcategory() async {
    category = await AppServer().showCategory();
    categorylist.add(category!);
    refresh();
  }
}
