import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mango_valley/model/cartmodel.dart';
import 'package:mango_valley/services/dbhelper.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  DBHelper? dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }

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
                    return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 70,
                                child: Card(
                                    semanticContainer: true,
                                    elevation: 10,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  snapshot.data![index].title
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Container(
                                                  child: Text(
                                                    snapshot.data![index].price
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.delete)))
                                      ],
                                    )),
                              ),
                            );
                          }),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
