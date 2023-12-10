import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/model/cartmodel.dart';
import 'package:mango_valley/services/dbhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cartcontroller extends GetxController {
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
    prefs.setInt('cart_item', _counter as int);
    prefs.setDouble('total_price', _totalPrice as double);
    refresh();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = (prefs.getInt('cart_item') ?? 0) as RxInt;
    _totalPrice = (prefs.getDouble('total_price') ?? 0.0) as RxDouble;
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

  RxDouble getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    refresh();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    refresh();
  }

  RxInt getCounter() {
    _getPrefItems();
    return _counter;
  }
}
