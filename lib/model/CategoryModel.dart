class CategoryModel {
  String? message;
  List<Data>? data;

  CategoryModel({this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? catname;
  String? picture;

  Data({this.id, this.catname, this.picture});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catname = json['catname'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catname'] = this.catname;
    data['picture'] = this.picture;
    return data;
  }
}
