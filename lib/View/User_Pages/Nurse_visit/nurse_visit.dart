import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NurseVisit extends StatefulWidget {
  const NurseVisit({super.key});

  @override
  State<NurseVisit> createState() => _NurseVisitState();
}

class _NurseVisitState extends State<NurseVisit> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(24.8846, 67.1754),
    zoom: 14.4746,
  );
  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(24.8846, 70.1754),
        infoWindow: InfoWindow(title: "Current Location".tr))
  ];
  String stAddress = '';
  String Latitude = " ";
  String Longitude = " ";
  bool address = false;
  final fireStore = FirebaseFirestore.instance.collection("User_appointments");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {});
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: kGooglePlex,
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () async {
            address = true;
            getUserCurrentLocation().then((value) async {
              print("My Location".tr);
              print(
                  value.latitude.toString() + " " + value.longitude.toString());
              _marker.add(Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(title: "My Location".tr)));
              Latitude = value.latitude.toString();
              Longitude = value.longitude.toString();

              List<Placemark> placemarks = await placemarkFromCoordinates(
                  value.latitude, value.longitude);
              stAddress = placemarks.reversed.last.country.toString() +
                  " " +
                  placemarks.reversed.last.locality.toString() +
                  " " +
                  placemarks.reversed.last.street.toString();
              CameraPosition cameraPosition = CameraPosition(
                  zoom: 14,
                  target: LatLng(
                    value.latitude,
                    value.longitude,
                  ));
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {});
            });
            Get.snackbar(
                "To proceed".tr, "Kindly click on your address mentioned below".tr,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.green,
                borderColor: Colors.black,
                borderWidth: 1);
          },
          child: Icon(Icons.navigation),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(children: [
          TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Confirm".tr,
                  middleText: "Are you sure you want to confirm".tr,
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  onConfirm: () {
                    setState(() {
                      fireStore.doc(user!.email).set({
                        "email": user.email,
                        "address": stAddress,
                        "type": "Nurse Visit"
                      });
                      Navigator.pop(context);
                    });
                  },
                  textCancel: "Cancel".tr,
                  textConfirm: "Confirm".tr,
                );
              },
              child: Text(
                address
                    ? stAddress
                    : "Address will appear here when you press the button".tr,
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
        ]),
      ),
    );
  }
}
