// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class VirtualConsultation extends StatefulWidget {
//   const VirtualConsultation({super.key});

//   @override
//   State<VirtualConsultation> createState() => _VirtualConsultationState();
// }

// class _VirtualConsultationState extends State<VirtualConsultation> {
//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition kGooglePlex = CameraPosition(
//     target: LatLng(24.8846, 67.1754),
//     zoom: 14.4746,
//   );
//   List<Marker> _marker = [];
//   List<Marker> _list = [
//     Marker(
//         markerId: MarkerId("1"),
//         position: LatLng(24.8846, 70.1754),
//         infoWindow: InfoWindow(title: "Current Location".tr))
//   ];
//   String stAddress = '';
//   String Latitude = " ";
//   String Longitude = " ";
//   bool address = false;
//   final fireStore = FirebaseFirestore.instance.collection("User_appointments");

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _marker.addAll(_list);
//   }

//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) {});
//     return await Geolocator.getCurrentPosition();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _auth = FirebaseAuth.instance;
//     final user = _auth.currentUser;

//     return Scaffold(
//       body: SafeArea(
//         child: GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: kGooglePlex,
//           markers: Set<Marker>.of(_marker),
//           myLocationEnabled: true,
//           compassEnabled: true,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       floatingActionButton: Align(
//         alignment: Alignment.bottomCenter,
//         child: FloatingActionButton(
//           onPressed: () async {
//             address = true;
//             getUserCurrentLocation().then((value) async {
//               print("My Location".tr);
//               print(
//                   value.latitude.toString() + " " + value.longitude.toString());
//               _marker.add(Marker(
//                   markerId: MarkerId("2"),
//                   position: LatLng(value.latitude, value.longitude),
//                   infoWindow: InfoWindow(title: "My Location".tr)));
//               Latitude = value.latitude.toString();
//               Longitude = value.longitude.toString();

//               List<Placemark> placemarks = await placemarkFromCoordinates(
//                   value.latitude, value.longitude);
//               stAddress = placemarks.reversed.last.country.toString() +
//                   " " +
//                   placemarks.reversed.last.locality.toString() +
//                   " " +
//                   placemarks.reversed.last.street.toString();
//               CameraPosition cameraPosition = CameraPosition(
//                   zoom: 14,
//                   target: LatLng(
//                     value.latitude,
//                     value.longitude,
//                   ));
//               final GoogleMapController controller = await _controller.future;
//               controller.animateCamera(
//                   CameraUpdate.newCameraPosition(cameraPosition));
//               setState(() {});
//             });
//             Get.snackbar(
//                 "To proceed".tr, "Kindly click on your address mentioned below".tr,
//                 duration: Duration(seconds: 5),
//                 backgroundColor: Colors.green,
//                 borderColor: Colors.black,
//                 borderWidth: 1);
//           },
//           child: Icon(Icons.navigation),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(children: [
//           TextButton(
//               onPressed: () {
//                 Get.defaultDialog(
//                   title: "Confirm".tr,
//                   middleText: "Are you sure you want to confirm".tr,
//                   onCancel: () {
//                     Navigator.pop(context);
//                   },
//                   onConfirm: () {
//                     setState(() {
//                       fireStore.doc(user!.email).set({
//                         "email": user.email,
//                         "address": stAddress,
//                         "type": "Virtual Consultation",
//                       });
//                       Navigator.pop(context);
//                     });
//                   },
//                   textCancel: "Cancel".tr,
//                   textConfirm: "Confirm".tr,
//                 );
//               },
//               child: Text(
//                 address
//                     ? stAddress
//                     : "Address will appear here when you press the button".tr,
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               )),
//         ]),
//       ),
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/user_models.dart';

import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class AvailableProviders extends StatelessWidget {
  AvailableProviders({
    Key? key,
  }) : super(key: key);
  final user_appointments =
      FirebaseFirestore.instance.collection("Registered Providers").snapshots();
  // final accepted_appointments =
  //     FirebaseFirestore.instance.collection("Accepted_appoinments");

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    return Scaffold(
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
                                snapshot.data!.docs[index]['fullname']
                                    .toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(snapshot
                                  .data!.docs[index]['experience']
                                  .toString()),
                              leading: Image.network(
                                snapshot.data!.docs[index]['profilePic'],
                                fit: BoxFit.cover,
                              ),
                              trailing: Container(
                                child: Text("Price 46 SAR".tr),
                              )),
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

//  Get.defaultDialog(
                                  //     title: 'Accept Appointment'.tr,
                                  //     middleText: "Are you sure?".tr,
                                  //     textConfirm: 'Yes'.tr,
                                  //     textCancel: 'No'.tr,
                                  //     onConfirm: () async {
                                  //       accepted_appointments
                                  //           .doc(user!.uid)
                                  //           .set({
                                  //         'email': snapshot.data!.docs[index]
                                  //             ['email'],
                                  //         'address': snapshot.data!.docs[index]
                                  //             ['address'],
                                  //       });
                                  //       Navigator.pop(context);
                                  //     },
                                  //     onCancel: () {
                                  //       Navigator.pop(context);
                                  //     });