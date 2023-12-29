// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:health/Resources/AppColors/app_colors.dart';
// import 'package:health/View/Service%20Provider/Doctor_Visit/doctor_visit_provider.dart';
// import 'package:health/View/Service%20Provider/Laboratory/laboratory_provider.dart';
// import 'package:health/View/Service%20Provider/Nurse_Visit/nurse_visit_provider.dart';
// import 'package:health/View/Service%20Provider/Virtual_Consultation/virtual_consultation_provider.dart';
// import 'package:health/View/Service%20Provider/Vitamin_IV_Drips_And_Fluids/vitamin_drips_and_fluids_provider.dart';

// class Slider_Provider extends StatelessWidget {
//   const Slider_Provider({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         enlargeCenterPage: true,
//         autoPlay: true,
//         height: 200,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         viewportFraction: 0.8,
//       ),
//       items: [
//         _buildCarouselItem(
//           "249 SAR",
//           "30% Discount for the first order",
//           MyColors.red,
//           Colors.white,
//           Icons.medical_services_outlined,
//           "Doctor Visit",
//           () => Get.to(() => DoctorRequests()),
//         ),
//         _buildCarouselItem(
//           "199 SAR",
//           "30% Discount for the first order",
//           MyColors.yellow,
//           Colors.white,
//           Icons.science_outlined,
//           "Laboratory",
//           () => Get.to(() => LaboratoryRequests()),
//         ),
//         _buildCarouselItem(
//           "149 SAR",
//           "30% Discount for the first order",
//           MyColors.litePurple,
//           Colors.white,
//           Icons.videocam_outlined,
//           "Virtual Consultation",
//           () => Get.to(() => VirtualConsultationRequest()),
//         ),
//         _buildCarouselItem(
//           "229 SAR",
//           "30% Discount for the first order",
//           MyColors.skin,
//           Colors.white,
//           Icons.healing_outlined,
//           "Nurse Visit",
//           () => Get.to(() => NurseVisitRequest()),
//         ),
//         _buildCarouselItem(
//           "179 SAR",
//           "30% Discount for the first order",
//           MyColors.blue,
//           Colors.white,
//           Icons.opacity_outlined,
//           "Vitamin IV drips and fluids",
//           () => Get.to(() => VitaminRequest()),
//         ),
//       ],
//     );
//   }

//   Widget _buildCarouselItem(
//     String heading,
//     String description,
//     Color upperPartColor,
//     Color lowerPartColor,
//     IconData iconData,
//     String slideHeading,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 5,
//         child: Container(
//           width: 300,
//           margin: EdgeInsets.all(0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Upper Part
//               Container(
//                 width: 300,
//                 color: upperPartColor,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         iconData,
//                         size: 24.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         slideHeading,
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         heading,
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Lower Part
//               Container(
//                 width: 300,
//                 color: lowerPartColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     description,
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
