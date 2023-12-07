class Productmodel {
  String? message;
  List<Data>? data;

  Productmodel({this.message, this.data});

  Productmodel.fromJson(Map<String, dynamic> json) {
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
  String? picture;
  String? title;
  String? catname;
  String? price;
  String? amount;
  String? quality;
  String? size;
  String? description;
  String? viewCount;
  String? stock;
  String? postby;

  Data(
      {this.id,
      this.picture,
      this.title,
      this.catname,
      this.price,
      this.amount,
      this.quality,
      this.size,
      this.description,
      this.viewCount,
      this.stock,
      this.postby});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    title = json['title'];
    catname = json['catname'];
    price = json['price'];
    amount = json['amount'];
    quality = json['quality'];
    size = json['size'];
    description = json['description'];
    viewCount = json['view_count'];
    stock = json['stock'];
    postby = json['postby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['title'] = this.title;
    data['catname'] = this.catname;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['quality'] = this.quality;
    data['size'] = this.size;
    data['description'] = this.description;
    data['view_count'] = this.viewCount;
    data['stock'] = this.stock;
    data['postby'] = this.postby;
    return data;
  }
}
