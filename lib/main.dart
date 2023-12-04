import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/screen/Homepage.dart';
//import 'package:mango_valley/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
