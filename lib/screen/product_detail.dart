import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/Product_conroller.dart';
import 'package:mango_valley/model/cartmodel.dart';
import 'package:mango_valley/services/dbhelper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mango_valley/screen/colors.dart';

class Productdetail extends StatefulWidget {
  int? pro_id;
  Productdetail({Key? key, required this.pro_id}) : super(key: key);

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  late int fruitAmount = 1;
  Color? selectedButtonColor;
  Color? selectedHeartIcon;
  final Productconroller productinfo = Get.put(Productconroller());
  DBhelper? dbHelper = DBhelper();
  @override
  void initState() {
    super.initState();
    productinfo.proinfo(id: widget.pro_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.green.shade500,
                  Colors.yellow.shade500,
                ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: productinfo.productinfo != null
                      ? Image.network(
                          'https://mangobee.influxdev.com/public/productpic/${productinfo.productinfo?.data?[0].picture}',
                          height: MediaQuery.of(context).size.height * 0.3,
                        )
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: productinfo.productinfo != null
                  ? _buildProductDetails()
                  : _buildShimmerEffect(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 30.0,
        right: 30.0,
        bottom: 20.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            productinfo.productinfo!.data![0].title.toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColor.mainTextColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          Text(
            "1 each",
            style: TextStyle(
              fontSize: 18.0,
              color: AppColor.secondTextColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        fruitAmount >= 2 ? fruitAmount-- : fruitAmount;
                      });
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: AppColor.cardGreyColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            20.0,
                          ),
                          bottomLeft: Radius.circular(
                            20.0,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColor.cardGreyColor,
                    ),
                    child: Text(
                      '$fruitAmount',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        fruitAmount >= 1 ? fruitAmount++ : fruitAmount;

                        100 * fruitAmount;
                      });
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: AppColor.cardGreyColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(
                            20.0,
                          ),
                          bottomRight: Radius.circular(
                            20.0,
                          ),
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
              Expanded(
                child: Container(),
              ),
              Text(
                (productinfo.productinfo!.data![0].price.toString() *
                        fruitAmount) +
                    '৳',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            "Product Description",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColor.mainTextColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          Text(
            productinfo.productinfo!.data![0].description.toString(),
            style: TextStyle(
              height: 1.4,
              fontSize: 18.0,
              color: AppColor.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () async {
              await dbHelper!
                  .insert(CartModel(
                      id: productinfo.productinfo!.data![0].id!.toInt(),
                      title: productinfo.productinfo!.data![0].title.toString(),
                      price: productinfo.productinfo!.data![0].price.toString(),
                      amount:
                          productinfo.productinfo!.data![0].amount.toString(),
                      picture:
                          productinfo.productinfo!.data![0].picture.toString()))
                  .then((value) => print(value));
            },
            child: Container(
              height: 60.0,
              // width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  40.0,
                ),
                color: AppColor.yellowBigButtonColor,
              ),
              child: const Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 30.0,
          bottom: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200.0,
              height: 20.0,
              color: Colors.white,
            ),
            Container(
              width: 150.0,
              height: 16.0,
              color: Colors.white,
            ),
            Container(
              width: 250.0,
              height: 16.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
