class ProfileModel {
  String? message;
  Data? data;

  ProfileModel({this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userpic;
  String? name;
  String? phonenumber;

  Data({this.id, this.userpic, this.name, this.phonenumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userpic = json['userpic'];
    name = json['name'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userpic'] = this.userpic;
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    return data;
  }
}
