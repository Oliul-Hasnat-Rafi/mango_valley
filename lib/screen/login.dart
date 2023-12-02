import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mango_valley/mango_server/app_server.dart';
import 'package:mango_valley/screen/Homepage.dart';
import 'package:mango_valley/screen/singup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
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
                          height: 90,
                        ),
                        Text(
                          "Login in your",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "Account",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/login_mango.jpg',
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: phonecontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passcontroller,
                  style: TextStyle(),
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(238, 49, 2, 75)),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepOrange.shade400,
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            var response = await AppServer.login(
                              phone: phonecontroller.text.toLowerCase(),
                              password: passcontroller.text.toString(),
                            );

                            if (response.statusCode == 200) {
                              Get.showSnackbar(
                                GetSnackBar(
                                  message: response.data["message"].toString(),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                              Get.to(Homepage());
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => singup()));
                      },
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(238, 49, 2, 75),
                            fontSize: 18),
                      ),
                      style: ButtonStyle(),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(238, 49, 2, 75),
                            fontSize: 18,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
