import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/View/Provider_Authentication/provider_login.dart';
import 'package:health/View/User_Authentication/user_login.dart';

class Splash_Screen extends StatefulWidget {
  Splash_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Harees'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                Get.updateLocale(Locale('en', "EN"));
              });
            },
            child: Text(
              'English',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 16),
          TextButton(
            onPressed: () {
              setState(() {
                Get.updateLocale(Locale('ar', "AE"));
              });
              // Add your Arabic button logic here
            },
            child: Text(
              'Arabic',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/logo/harees_logo.png"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Harees".tr,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                text: "Join as a user".tr,
                onTap: () {
                  Get.to(() => LoginScreen());
                },
              ),
              SizedBox(
                height: 10,
              ),
              RoundButton(
                text: "Join as a provider".tr,
                onTap: () {
                  Get.to(() => Provider_login());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}