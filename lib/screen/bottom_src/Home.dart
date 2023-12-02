import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/model/CategoryModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> swiperlist = [
    'images/mango1.jpg',
    // 'images/mango2.jpg',
    // 'images/mango3.jpg'
  ];
  TextEditingController searchController = TextEditingController();
  CategoryModel? _category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Call your showCategory function to get data
    try {
      CategoryModel category = await AppServer().showCategory();
      setState(() {
        _category = category;
      });
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        child: Column(
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
            //cursor
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Swiper(
                    itemBuilder: (context, index) {
                      return Image.asset(
                        swiperlist[index],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: swiperlist.length,
                    duration: 1000,
                    pagination:
                        const SwiperPagination(builder: SwiperPagination.rect),
                    autoplay: true),
              ),
            ),

            Container(
              height: 80,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var categoryItem = _category!.data![index];
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
                                              categoryItem.picture.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    categoryItem.catname.toString(),
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
                ),
              ),
            ),

            Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // autogroupzwkbfeD (NoaDiau4EcfkdxsBJMzwKB)

                    child: Stack(
                      children: [
                        Positioned(
                          child: Align(
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            child: SizedBox(
                              child: Text(
                                'Tissot watch',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xff080808),
                                  decorationColor: Color(0xff080808),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff47500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            child: SizedBox(
                              child: Text(
                                '10%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xff080808),
                                  decorationColor: Color(0xff080808),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            child: SizedBox(
                                child: Image.asset(
                              'images/mango1.jpg',
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            child: SizedBox(
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'images/mango1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            '\$200',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                              color: Color(0xff080808),
                              decorationColor: Color(0xff080808),
                            ),
                          ),
                        ),
                        Text(
                          // vA9 (5:71)
                          '\$150',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff080808),
                            decorationColor: Color(0xff080808),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
