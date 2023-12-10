import 'package:get/get.dart';
import 'package:mango_valley/main.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/model/ProfileModel.dart';

class Profilecontroller extends GetxController {
  ProfileModel? Profile;

  RxList<ProfileModel> Profilelist = <ProfileModel>[].obs;

  fetchcategory() async {
    Profile = await AppServer().showProfile(user_id: box!.get('id').toString());
    Profilelist.add(Profile!);
    refresh();
  }
}
