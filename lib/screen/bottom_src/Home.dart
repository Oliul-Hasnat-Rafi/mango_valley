import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/Product_conroller.dart';
import 'package:mango_valley/conroller/category_conroller.dart';
import 'package:mango_valley/screen/buildContainer.dart';
import 'package:mango_valley/screen/product_detail.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  final Categoryconroller catcontroller = Get.put(Categoryconroller());
  final Productconroller productcontroller = Get.put(Productconroller());
  List<String> swiperlist = [
    'images/mango1.jpg',
    // 'images/mango2.jpg',
    // 'images/mango3.jpg'
  ];
  bool isava = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catcontroller.fetchcategory();
    productcontroller.fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Search',
                    suffixIcon: searchController.text.isEmpty
                        ? const Icon(Icons.search)
                        : GestureDetector(
                            onTap: () {
                              searchController.text = "";
                              setState(() {});
                            },
                            child: Icon(Icons.clear)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      print(searchController);
                    });
                  },
                ),
              ),
              //             //cursor
              Expanded(
                child: Swiper(
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(swiperlist[index]),
                                    fit: BoxFit.fill)),
                          ));
                    },
                    itemCount: swiperlist.length,
                    duration: 1000,
                    pagination:
                        const SwiperPagination(builder: SwiperPagination.rect),
                    autoplay: true),
              ),

              //category
              Container(
                  height: 80,
                  child: Expanded(
                    child: Obx(
                      () => catcontroller.categorylist.isNotEmpty
                          ? ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              // primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: catcontroller.category?.data?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: UnconstrainedBox(
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://mangobee.influxdev.com/public/catpic/' +
                                                          catcontroller
                                                              .category!
                                                              .data![index]
                                                              .picture
                                                              .toString()),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                catcontroller.category!
                                                    .data![index].catname
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Container(
                                height: 80,
                                child: Expanded(
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UnconstrainedBox(
                                        child: Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade200,
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(''),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  )),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fresh Mango',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(238, 49, 2, 75)),
                ),
              ),

              Expanded(
                child: Obx(
                  () => productcontroller.productlist.isNotEmpty
                      ? ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          // primary: false,
                          itemCount: productcontroller.Products?.data?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(Productdetail(
                                          pro_id: productcontroller
                                              .Products!.data![index].id));
                                    },
                                    child: buildContainer(
                                      product: productcontroller
                                          .Products!.data![index],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          var datalist = productcontroller
                                              .Products!.data![index].id;
                                          //print(datalist);
                                          if (productcontroller.favtproduct
                                              .contains(datalist)) {
                                            productcontroller.favtproduct
                                                .remove(datalist);
                                            const snackdemo = SnackBar(
                                              content: Text('Remove from Favt'),
                                              backgroundColor: Colors.green,
                                              elevation: 10,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.all(5),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackdemo);
                                          } else {
                                            productcontroller.favtproduct
                                                .add(datalist);

                                            const snackdemo = SnackBar(
                                              content: Text('Add to Favt'),
                                              backgroundColor: Colors.green,
                                              elevation: 10,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.all(5),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackdemo);
                                          }
                                        },
                                        child: Obx(
                                          () => Icon(
                                            Icons.favorite,
                                            color: productcontroller.favtproduct
                                                    .contains(productcontroller
                                                        .Products!
                                                        .data![index]
                                                        .id)
                                                ? Colors.orange
                                                : Colors.green.shade400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Expanded(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount:
                                    productcontroller.Products?.data?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Stack(
                                      children: [
                                        buildContainer(),
                                        Padding(
                                          padding:
                                              EdgeInsets.all(defaultPadding),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Icon(
                                              Icons.favorite_sharp,
                                              color: Colors.green.shade300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
