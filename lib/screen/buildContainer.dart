import 'package:flutter/material.dart';
import 'package:mango_valley/model/Product_model.dart';

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

class buildContainer extends StatefulWidget {
  Data? product;
  buildContainer({super.key, this.product});

  @override
  State<buildContainer> createState() => _buildContainerState();
}

class _buildContainerState extends State<buildContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImageContainer(),
          Padding(
            padding: EdgeInsets.only(left: textPadding),
            child: Text(
              widget.product!.title.toString(),
              style: titleTextStyle,
            ),
          ),
          buildRow(),
        ],
      ),
    );
  }

  Widget buildImageContainer() {
    return Padding(
      padding: EdgeInsets.all(imagePadding),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://mangobee.influxdev.com/public/productpic/' +
                      widget.product!.picture.toString()),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget buildRow() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: rowPadding, right: rowPadding),
          child: Text(
            widget.product!.amount.toString() + 'KG',
            style: titleTextStyle,
          ),
        ),
        Text(
          widget.product!.price.toString() + '৳',
          style: titleTextStyle.copyWith(color: Colors.orange),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(circleAvatarPadding),
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
