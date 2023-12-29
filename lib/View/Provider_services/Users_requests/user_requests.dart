// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class UserRequests extends StatefulWidget {
  const UserRequests({
    Key? key,
  }) : super(key: key);

  @override
  State<UserRequests> createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appointments").snapshots();

  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appointments");

  final CollectionReference user_appointment_delete =
      FirebaseFirestore.instance.collection("User_appointments");
  final _auth = FirebaseAuth.instance;

  bool acceptAppointment = false;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        centerTitle: true,
        title: Text(
          'Appointments'.tr,
        )
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            onTap: () {
                              Get.defaultDialog(
                                title: 'Accept Appointment'.tr,
                                middleText: "Are you sure?".tr,
                                textConfirm: 'Yes'.tr,
                                textCancel: 'No'.tr,
                                onConfirm: () async {
                                  try {
                                    String email = snapshot
                                        .data!.docs[index]['email']
                                        .toString();
                                    String address = snapshot
                                        .data!.docs[index]['address']
                                        .toString();
                                    String type =
                                        snapshot.data!.docs[index]["type"];

                                    if (user != null) {
                                      // User is not null, safe to access properties
                                      await accepted_appointments
                                          .doc(user.email)
                                          .collection(
                                              "accepted_appointments_list")
                                          .add({
                                        'email': email,
                                        'address': address,
                                        'type': type
                                      });

                                      await user_appointment_delete
                                          .doc(snapshot.data!.docs[index].id)
                                          .delete();
                                      setState(() {});

                                      Navigator.pop(context);
                                    } else {
                                      // Handle the case where user is null
                                      print('User is null');
                                    }
                                  } catch (e) {
                                    print('Error accepting appointment: $e');
                                  }
                                  Get.snackbar(
                                    "Success".tr,
                                    "Appointment Accepted check your accepted appointments".tr,
                                    backgroundColor:
                                        Color.fromARGB(255, 104, 247, 109),
                                    colorText: Colors.black,
                                    borderColor: Colors.black,
                                    borderWidth: 1,
                                    duration: Duration(seconds: 1),
                                  );
                                },
                                onCancel: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            title: Text(
                              snapshot.data!.docs[index]['email'].toString(),
                              style: TextStyle(
                                  color: Colors.blue[700], fontSize: 16),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['address']
                                      .toString(),
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data!.docs[index]["type"].toString(),
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            leading: Icon(
                              Icons.person,
                              color: Colors.blue[700],
                              size: 40,
                            ),
                            trailing: Icon(
                              Icons.medical_services,
                              size: 35,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
