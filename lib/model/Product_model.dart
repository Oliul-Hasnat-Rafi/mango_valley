class ProductModel {
  String message;
  Map<String, ProductItem> data;

  ProductModel({required this.message, required this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> dataJson = json['data'];
    Map<String, ProductItem> data = Map.fromEntries(dataJson.entries.map(
        (entry) => MapEntry(entry.key, ProductItem.fromJson(entry.value))));

    return ProductModel(
      message: json['message'],
      data: data,
    );
  }
}

class ProductItem {
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
  String? postBy;

  ProductItem({
    this.id,
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
    this.postBy,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      picture: json['picture'],
      title: json['title'],
      catname: json['catname'],
      price: json['price'],
      amount: json['amount'],
      quality: json['quality'],
      size: json['size'],
      description: json['description'],
      viewCount: json['view_count'],
      stock: json['stock'],
      postBy: json['postby'],
    );
  }
}
