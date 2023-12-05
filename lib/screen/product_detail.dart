import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/Product_conroller.dart';
import 'package:mango_valley/screen/colors.dart';

class Productdetail extends StatefulWidget {
  int? pro_id;
  Productdetail({super.key, required this.pro_id});

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  late int fruitAmount = 1;
  Color? selectedButtonColor;
  Color? selectedHeartIcon;
  final Productconroller productinfo = Get.put(Productconroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productinfo.proinfo(id: widget.pro_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: productinfo.productinfolist.length,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Center(
                          child: Image.network(
                            'https://mangobee.influxdev.com/public/productpic/${productinfo.productinfo!.data![index].picture}',
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40.0,
                      left: 30.0,
                      right: 30.0,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                12.0,
                              ),
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: AppColor.cardGreyColor,
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: Center(
                                  // child: FaIcon(
                                  //   FontAwesomeIcons.angleLeft,
                                  //   color: AppColor.mainTextColor,
                                  // ),
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          // SvgPicture.asset(
                          //   'img/svg/menu.svg',
                          //   height: 40,
                          //   width: 40,
                          //   color: AppColor.mainTextColor,
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.37,
                      bottom: 0.0,
                      right: 0.0,
                      left: 0.0,
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
                            Text(
                              productinfo.productinfo!.data![index].title
                                  .toString(),
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: AppColor.mainTextColor,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              "1 each",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColor.secondTextColor,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fruitAmount >= 2
                                              ? fruitAmount--
                                              : fruitAmount;
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
                                        // child: const FaIcon(
                                        //   FontAwesomeIcons.minus,
                                        //   size: 15.0,
                                        // ),
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
                                          fruitAmount >= 1
                                              ? fruitAmount++
                                              : fruitAmount;

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
                                        // child: const FaIcon(
                                        //   FontAwesomeIcons.plus,
                                        //   size: 15.0,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                // Text(
                                //   '${(widget.singleFruitPrice * fruitAmount).toStringAsFixed(2)} \$ ',
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 30.0,
                                //   ),
                                // ),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            // Text(
                            //   widget.singleFruitDescription,
                            //   style: TextStyle(
                            //     height: 1.4,
                            //     fontSize: 18.0,
                            //     color: AppColor.mainTextColor,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButtonColor =
                                          AppColor.yellowBigButtonColor;
                                      selectedHeartIcon =
                                          AppColor.backgroundColor;
                                    });
                                  },
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        25.0,
                                      ),
                                      border: Border.all(
                                        width: 2.0,
                                        color: AppColor.yellowBigButtonColor,
                                      ),
                                      color: selectedButtonColor ==
                                              AppColor.yellowBigButtonColor
                                          ? AppColor.yellowBigButtonColor
                                          : AppColor.backgroundColor,
                                    ),
                                    child: Center(
                                        // child: FaIcon(
                                        //   FontAwesomeIcons.solidHeart,
                                        //   size: 40.0,
                                        //   color: selectedHeartIcon ==
                                        //           AppColor.backgroundColor
                                        //       ? AppColor.backgroundColor
                                        //       : AppColor.yellowBigButtonColor,
                                        // ),
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        30.0,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
