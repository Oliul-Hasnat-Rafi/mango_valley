import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mango_valley/screen/Homepage.dart';
import 'package:mango_valley/screen/login.dart';

//import 'package:mango_valley/screen/login.dart';
Box? box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('Login');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
