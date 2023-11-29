import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mango_valley/singup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
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
                          onPressed: () {},
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
