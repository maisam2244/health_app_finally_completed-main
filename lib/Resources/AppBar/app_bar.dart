// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/Chat_App/Models/user_models.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyAppBar({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/logo/harees_logo.png"),
        ),
      ),
      title: Text(
        userModel.fullname ?? 'User',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
