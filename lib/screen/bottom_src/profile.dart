import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango_valley/conroller/profilecontroller.dart';
import 'package:mango_valley/screen/Homepage.dart';
import 'package:mango_valley/screen/login.dart';

const TextStyle titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color.fromARGB(238, 49, 2, 75),
);

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Profilecontroller Profilecontrollers = Get.put(Profilecontroller());

  @override
  void initState() {
    super.initState();
    Profilecontrollers.fetchprofile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                width: 250,
                margin: EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://mangobee.influxdev.com/public/userpic/${Profilecontrollers.Profilelist[0].data!.userpic.toString()}'),
                        radius: 180,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
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
                child: Obx(
                  () => Text(
                    Profilecontrollers.Profilelist[0].data!.name.toString(),
                    style: titleTextStyle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Obx(
                  () => Text(
                    Profilecontrollers.Profilelist[0].data!.phonenumber
                        .toString(),
                    style: titleTextStyle,
                  ),
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
                      primary: Colors.orange,
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
