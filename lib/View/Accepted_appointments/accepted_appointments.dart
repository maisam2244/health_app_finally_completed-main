// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/user_models.dart';

import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class AcceptedAppointments extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  AcceptedAppointments({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appoinments").snapshots();
  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appoinments");

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    return Scaffold(
      appBar: MyAppBar(
        firebaseUser: firebaseUser,
        userModel: userModel,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MySearchBar(),
          SizedBox(
            height: 15,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: user_appointments,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong'.tr);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading".tr);
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docs[index]['email'].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(snapshot.data!.docs[index]['address']
                                .toString()),
                            leading: Icon(Icons.star),
                            trailing: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: 'Accept Appointment'.tr,
                                      middleText: "Are you sure?".tr,
                                      textConfirm: 'Yes'.tr,
                                      textCancel: 'No'.tr,
                                      onConfirm: () async {
                                        accepted_appointments
                                            .doc(user!.uid)
                                            .set({
                                          'email': snapshot.data!.docs[index]
                                              ['email'],
                                          'address': snapshot.data!.docs[index]
                                              ['address'],
                                        });
                                        Navigator.pop(context);
                                      },
                                      onCancel: () {
                                        Navigator.pop(context);
                                      });
                                },
                                child: Icon(Icons.chevron_right)),
                            onTap: () {},
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      )),
    );
  }
}
