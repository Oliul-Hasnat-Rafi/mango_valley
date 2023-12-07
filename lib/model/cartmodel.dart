class CartModel {
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

  CartModel(
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

  CartModel.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        picture = res['picture'],
        title = res['title'],
        catname = res['catname'],
        price = res['price'],
        amount = res['amount'],
        quality = res['quality'],
        size = res['size'],
        description = res['description'],
        viewCount = res['view_count'],
        stock = res['stock'],
        postby = res['postby'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'picture': picture,
      'title': title,
      'catname': catname,
      'price': price,
      'amount': amount,
      'quality': quality,
      'size': size,
      'description': description,
      'view_count': viewCount,
      'stock': stock,
      'postby': postby,
    };
  }
}
