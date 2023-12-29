// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_practice/Widgets/Utils.dart';
// import 'package:firebase_practice/pages/phone_verification.dart';
// import 'package:firebase_practice/widget/round_button.dart';
// import 'package:flutter/material.dart';

// class LoginPhone extends StatefulWidget {
//   const LoginPhone({super.key});

//   @override
//   State<LoginPhone> createState() => _LoginPhoneState();
// }

// class _LoginPhoneState extends State<LoginPhone> {
//   final auth = FirebaseAuth.instance;
//   final phonenumberController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login with phone"),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
//                 child: TextFormField(
//                   controller: phonenumberController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       hintText: "+92 318 011 8178",
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black))),
//                 ),
//               ),
//               RoundButton(
//                   text: "Send code",
//                   onTap: () {
//                     auth.verifyPhoneNumber(
//                         phoneNumber: phonenumberController.text,
//                         verificationCompleted: (_) {},
//                         verificationFailed: (e) {
//                           Utils().toastMessage(e.toString());
//                         },
//                         codeSent: (String verficationId, int? token) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PhoneVerify(
//                                       verificationId: verficationId)));
//                         },
//                         codeAutoRetrievalTimeout: (e) {
//                           Utils().toastMessage(e.toString());
//                         });
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
