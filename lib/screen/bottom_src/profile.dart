import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/profilecontroller.dart';
import 'package:mango_valley/screen/Homepage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Profilecontroller Profilecontrollers = Get.put(Profilecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://mangobee.influxdev.com/public/userpic/' +
                              Profilecontrollers.Profile!.data!.userpic
                                  .toString()),
                      radius: 150,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  Profilecontrollers.Profile!.data!.name.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  Profilecontrollers.Profile!.data!.phonenumber.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const Homepage()),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.yellow,
                      fixedSize: Size(250, 15)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }
}
