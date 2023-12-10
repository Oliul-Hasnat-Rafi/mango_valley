import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/screen/login.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Create new \n Account",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(238, 49, 2, 75),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/singup_mango.jpg',
                        height: 250,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: namecontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordcontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var response = await AppServer.register(
                        phone: phonecontroller.text.toLowerCase(),
                        password: passwordcontroller.text.toString(),
                        name: namecontroller.text.toString());

                    if (response.statusCode == 200) {
                      Get.showSnackbar(
                        GetSnackBar(
                          message: response.data["message"].toString(),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                      Get.to(login());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade400,
                      fixedSize: Size(150, 30),
                      //     shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30))
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(238, 49, 2, 75),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(login());
                        },
                        child: Text(
                          'Login in',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(238, 49, 2, 75),
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
