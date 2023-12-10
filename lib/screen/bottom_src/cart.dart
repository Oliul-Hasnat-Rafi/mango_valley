import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/cart_conroller.dart';
import 'package:mango_valley/model/cartmodel.dart';
import 'package:mango_valley/screen/colors.dart';
import 'package:mango_valley/services/dbhelper.dart';

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

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  DBhelper? dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBhelper();
  }

  final cartcontroller cartscontroller = Get.put(cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<CartModel>?>(
                future: dbHelper!.getCartList(),
                builder: (context, AsyncSnapshot<List<CartModel>?> snapshot) {
                  if (snapshot.data == null) {
                    return SpinKitFadingCircle(
                      color: Colors.black,
                      size: 50.0,
                      duration: Duration(milliseconds: 1500),
                    ); // Text("No Note available", style: TextStyle(color: index.isEven? Colors.black: Colors.red, fontSize: 15));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Stack(
                              children: [
                                UnconstrainedBox(
                                  child: Container(
                                    height: 230,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  dbHelper!.delete(CartModel(
                                                      id: snapshot
                                                          .data![index].id
                                                          .toInt(),
                                                      title: snapshot
                                                          .data![index].title
                                                          .toString(),
                                                      price: snapshot
                                                          .data![index].price
                                                          .toString(),
                                                      amount: snapshot
                                                          .data![index].amount
                                                          .toString(),
                                                      picture: snapshot
                                                          .data![index].picture
                                                          .toString()));
                                                });
                                              },
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.delete),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        'https://mangobee.influxdev.com/public/productpic/' +
                                                            snapshot
                                                                .data![index]
                                                                .picture
                                                                .toString(),
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: defaultPadding),
                                          child: Text(
                                            snapshot.data![index].title
                                                .toString(),
                                            style: titleTextStyle,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  defaultPadding),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      int quantity = int.parse(
                                                          snapshot.data![index]
                                                              .amount);

                                                      int price = int.parse(
                                                          snapshot.data![index]
                                                              .price);
                                                      quantity--;

                                                      int? newPrice =
                                                          price * quantity;
                                                      if (quantity > 0) {
                                                        await dbHelper!
                                                            .updatecart(CartModel(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toInt(),
                                                                title: snapshot
                                                                    .data![
                                                                        index]
                                                                    .title
                                                                    .toString(),
                                                                price: newPrice
                                                                    .toString(),
                                                                amount: quantity
                                                                    .toString(),
                                                                picture: snapshot
                                                                    .data![
                                                                        index]
                                                                    .picture
                                                                    .toString()))
                                                            .then((value) =>
                                                                print(value));
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: AppColor
                                                            .cardGreyColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: AppColor
                                                          .cardGreyColor,
                                                    ),
                                                    child: Text(
                                                      snapshot
                                                          .data![index].amount
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      int quantity = int.parse(
                                                          snapshot.data![index]
                                                              .amount);

                                                      int price = int.parse(
                                                          snapshot.data![index]
                                                              .price);
                                                      quantity++;

                                                      int? newPrice =
                                                          price * quantity;
                                                      if (quantity > 0) {
                                                        await dbHelper!
                                                            .updatecart(CartModel(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toInt(),
                                                                title: snapshot
                                                                    .data![
                                                                        index]
                                                                    .title
                                                                    .toString(),
                                                                price: newPrice
                                                                    .toString(),
                                                                amount: quantity
                                                                    .toString(),
                                                                picture: snapshot
                                                                    .data![
                                                                        index]
                                                                    .picture
                                                                    .toString()))
                                                            .then((value) =>
                                                                print(value));
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: AppColor
                                                            .cardGreyColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(
                                            //       defaultPadding),
                                            // child: Text(
                                            //   (snapshot.data![index].price
                                            //       .toString()+'৳'),
                                            //   style: titleTextStyle.copyWith(
                                            //       color: Colors.orange),
                                            // ),
                                            //),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
