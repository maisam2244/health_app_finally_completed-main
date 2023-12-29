// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Laboratory extends StatefulWidget {
//   const Laboratory({super.key});

//   @override
//   State<Laboratory> createState() => _LaboratoryState();
// }

// class _LaboratoryState extends State<Laboratory> {
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
//                         "type": "Laboratory"
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

import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class Laboratory extends StatelessWidget {
  const Laboratory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        centerTitle: true,
        title: Text("Laboratory"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              MySearchBar(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Packages",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildListTile("تحلیل صورتہ الدم  ", "ابتدا من 60 ریال", Icons.science_outlined),
                    buildListTile("فحص فیتامین ب 12", "ابتدا من 120 ریال", Icons.science_outlined),
                    buildListTile("فحص الحرمون", "ابتدا من 180 ریال", Icons.science_outlined),
                    buildListTile("تحلیل السکر التراکمی", "ابتدا من 60 ریال", Icons.science_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget buildListTile(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyColors.purple,
          ),
        ),
        contentPadding: EdgeInsets.all(10),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(10),
              color: MyColors.purple,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        trailing: Icon(icon, color: Colors.black),
        tileColor: Colors.purple.shade800.withOpacity(0.2),
      ),
    );
  }
}