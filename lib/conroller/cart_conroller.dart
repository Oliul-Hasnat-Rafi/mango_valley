import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/model/cartmodel.dart';
import 'package:mango_valley/services/dbhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  DBhelper db = DBhelper();
  RxInt _counter = 0.obs;
  RxInt get counter => _counter;

  RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;

  late Future<List<CartModel>> _cart;
  Future<List<CartModel>> get cart => _cart;

  Future<List<CartModel>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter.value);
    prefs.setDouble('total_price', _totalPrice.value);
    refresh();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter.value = prefs.getInt('cart_item') ?? 0;
    _totalPrice.value = prefs.getDouble('total_price') ?? 0.0;
    refresh();
  }

  void addTotalPrice(productPrice) {
    _totalPrice = _totalPrice + productPrice as RxDouble;
    _setPrefItems();
    refresh();
  }

  void removeTotalPrice(productPrice) {
    _totalPrice = _totalPrice - productPrice as RxDouble;
    _setPrefItems();
    refresh();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice.value;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    refresh();
  }

  void removeCounter() {
    if (_counter > 0) {
      _counter--;
      _setPrefItems();
      refresh();
    }
  }

  int getCounter() {
    _getPrefItems();
    return _counter.value;
  }
}
