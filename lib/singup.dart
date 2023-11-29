import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mango_valley/login.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
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
                  //   controller: emailcontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  //    controller: passwordcontroller,
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
                  onPressed: () {
                    // login(emailcontroller.text.toString(),
                    //     passwordcontroller.text.toString());
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => login()));
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
