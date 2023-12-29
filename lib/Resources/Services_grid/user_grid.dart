import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/View/Provider_services/Accepted_requests/accepted_requests.dart';
import 'package:health/View/User_services/About_Us/aboutus.dart';
import 'package:health/View/User_services/Contact_us/user_contact_us.dart';
import 'package:health/View/User_services/Results/results.dart';
import 'package:health/View/User_services/User_appointments/User_appointments.dart';

class UserGridServices extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const UserGridServices({
    Key? key,
    required this.serviceIcon,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(serviceIcon, size: 40),
          onPressed: onPressed,
          color: Colors.green,
        ),
        SizedBox(height: 5),
        Text(
          serviceName,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class UserServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        UserGridServices(
          serviceIcon: Icons.calendar_month_outlined,
          serviceName: "Appointments".tr,
          onPressed: () {
            Get.to(() => MyAppointments());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Accepted appointments".tr,
          onPressed: () {
            Get.to(() => AcceptedRequests());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.list_alt,
          serviceName: "See result".tr,
          onPressed: () {
            Get.to(() => UserResult());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.message_outlined,
          serviceName: "Contact Us".tr,
          onPressed: () {
            Get.to(() => UserContact());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.family_restroom,
          serviceName: "Family".tr,
          onPressed: () {},
        ),
        UserGridServices(
          serviceIcon: Icons.info,
          serviceName: "About us".tr,
          onPressed: () {
            Get.to(() => AboutUsPage());
          },
        ),
      ],
    );
  }
}
