import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Chat_App/Pages/Home.dart';

import 'package:health/Resources/AppColors/app_colors.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  void Function()? ontap;
  MyDrawer({
    Key? key,
    this.ontap,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.purple,
            ),
            child: Center(
              child: Text(
                widget.userModel.fullname ?? 'User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("Chats".tr),
            onTap: () {
              Get.to(() => Home(
                  userModel: widget.userModel,
                  firebaseUser: widget.firebaseUser));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Your Account".tr),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings".tr),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout".tr),
              onTap: widget.ontap),
        ],
      ),
    );
  }
}
