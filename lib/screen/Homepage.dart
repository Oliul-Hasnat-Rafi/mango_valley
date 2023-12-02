import 'package:flutter/material.dart';
import 'package:mango_valley/screen/bottom_src/Home.dart';
import 'package:mango_valley/screen/bottom_src/cart.dart';
import 'package:mango_valley/screen/bottom_src/favt.dart';
import 'package:mango_valley/screen/bottom_src/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  var _currentIndex = 0;
  List pages = [Home(), Favt(), Cart(), Profile()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Mango Valley'),
            ),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.favorite_border),
                  title: Text("favorite"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text("Cart"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
            body: pages[_currentIndex]));
  }
}
