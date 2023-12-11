import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/Product_conroller.dart';

const double defaultPadding = 8.0;
const double imagePadding = 8.0;
const double textPadding = 8.0;
const double rowPadding = 8.0;
const double circleAvatarPadding = 5.0;

const TextStyle titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color.fromARGB(238, 49, 2, 75),
);

class Favt extends StatefulWidget {
  Favt({super.key});

  @override
  State<Favt> createState() => _FavtState();
}

class _FavtState extends State<Favt> {
  final Productconroller favtcontroller = Get.put(Productconroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Favourite',
                    style: titleTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favtcontroller.favtproduct.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final currentProductId =
                        favtcontroller.Products!.data![index].id;
                    if (favtcontroller.favtproduct.length != 0) {
                      if (favtcontroller.favtproduct
                          .contains(currentProductId)) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(imagePadding),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: 100,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://mangobee.influxdev.com/public/productpic/' +
                                                      favtcontroller.Products!
                                                          .data![index].picture
                                                          .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: textPadding),
                                        child: Text(
                                          favtcontroller
                                              .Products!.data![index].title
                                              .toString(),
                                          style: titleTextStyle,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: rowPadding,
                                                right: rowPadding),
                                            child: Text(
                                              favtcontroller.Products!
                                                      .data![index].amount
                                                      .toString() +
                                                  'KG',
                                              style: titleTextStyle,
                                            ),
                                          ),
                                          Text(
                                            favtcontroller.Products!
                                                    .data![index].price
                                                    .toString() +
                                                '৳',
                                            style: titleTextStyle.copyWith(
                                                color: Colors.orange),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                circleAvatarPadding),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.orange,
                                              child: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/no_favourite.png'))),
                          child: Text(
                            "You don't have any favourites",
                            style: titleTextStyle,
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
