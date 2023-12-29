// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Video_Call/call.dart';

class JoinCall extends StatelessWidget {
  final String userEmail;
  final String chatRoomid;
  final UserModel userModel;
  final User firebaseUser;

  JoinCall({
    Key? key,
    required this.userEmail,
    required this.chatRoomid,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        firebaseUser: firebaseUser,
        userModel: userModel,
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCall(callID: "1")));

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MyCall(callID: "1", userEmail: userEmail),
            //   ),
            // );
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MyCall(callID: chatRoomid, userEmail: userEmail)));
          },
          child: Text('Join Call'),
        )
      ]),
    );
  }
}
