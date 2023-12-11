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
  List pages = [Home(), Favt(), CartPage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'images/logo.png',
                fit: BoxFit.fill,
                height: 110,
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(238, 49, 2, 75),
                    borderRadius: BorderRadius.circular(10)),
                child: SalomonBottomBar(
                  currentIndex: _currentIndex,
                  onTap: (i) => setState(() => _currentIndex = i),
                  items: [
                    /// Home
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text("Home"),
                      selectedColor: Colors.purple,
                    ),

                    /// Likes
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      title: Text("favorite"),
                      selectedColor: Colors.pink,
                    ),

                    /// Search
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      title: Text("Cart"),
                      selectedColor: Colors.orange,
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text("Profile"),
                      selectedColor: Colors.teal,
                    ),
                  ],
                ),
              ),
            ),
            body: pages[_currentIndex]));
  }
}
