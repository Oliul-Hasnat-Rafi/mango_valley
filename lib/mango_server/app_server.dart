import 'package:dio/dio.dart';
import 'package:mango_valley/mango_server/api_list.dart';
import 'package:mango_valley/model/CategoryModel.dart';
import 'package:mango_valley/model/Product_model.dart';

class AppServer {
  // final store = GetStorage();

  // checData(){
  //   var data = store.read('token');
  //   return data;
  // }

  // clearData(){
  //   store.remove('token');
  //   store.remove('userID');
  // }

  static var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
  };

  static login({required String phone, required String password}) async {
    var response;
    var dio = Dio();
    String url = APIList.baseURL + APIList.login;
    try {
      response = await dio.post(url,
          data: {
            'phonenumber': phone,
            'password': password,
          },
          options: Options(headers: header));

      print('.........$response');

      return response;
    } catch (e) {
      print(e);
    }
  }

  static register(
      {required String phone,
      required String password,
      required String name}) async {
    var dio = Dio();
    String url = APIList.baseURL + APIList.register;
    try {
      var response = await dio.post(url,
          data: {
            'name': name,
            'phonenumber': phone,
            'password': password,
          },
          options: Options(headers: header));

      print('.........$response');

      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<CategoryModel> showCategory() async {
    var response;
    var dio = Dio();

    String url = APIList.baseURL.toString() + APIList.categoryList.toString();

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        return CategoryModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return CategoryModel.fromJson(response.data);
  }

  Future<Productmodel> showProduct() async {
    var response;
    var dio = Dio();

    String url = APIList.baseURL.toString() + APIList.productsList.toString();

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        return Productmodel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return Productmodel.fromJson(response.data);
  }

  // Future<ProfileModel> showProfile({required String user_id}) async {
  //   var response;
  //   var dio = Dio();

  //   String url = APIList.baseURL.toString() + APIList.profile.toString() + user_id;

  //   try{

  //     response = await dio.get(url);

  //     if(response.statusCode == 200)
  //     {
  //       return ProfileModel.fromJson(response.data);
  //     }

  //   }
  //   catch(e)
  //   {
  //     print(e);
  //   }

  //   return ProfileModel.fromJson(response.data);
  // }

  // static profileUpdate({required String phone, required String name, required String user_id}) async {
  //   var response;
  //   var dio = Dio();
  //   String url = APIList.baseURL + APIList.updateProfile;
  //   try{
  //     response = await dio.post(url,
  //     data: {
  //       'name': name,
  //       'phonenumber' : phone,
  //       'id' : user_id,
  //     },
  //     options: Options(
  //       headers: header
  //     ));

  //     print('.........$response');

  //     return response;
  //   }
  //   catch(e)
  //   {
  //     print(e);
  //   }
  // }
}
