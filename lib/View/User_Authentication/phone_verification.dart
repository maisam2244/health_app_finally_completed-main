// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../Widgets/Utils.dart';
// import '../widget/round_button.dart';

// class PhoneVerify extends StatefulWidget {
//   final String verificationId;
//   const PhoneVerify({
//     Key? key,
//     required this.verificationId,
//   }) : super(key: key);

//   @override
//   State<PhoneVerify> createState() => _PhoneVerifyState();
// }

// class _PhoneVerifyState extends State<PhoneVerify> {
//   final auth = FirebaseAuth.instance;
//   final verficationController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Verify code"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
//               child: TextFormField(
//                 controller: verficationController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     hintText: "456789",
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black))),
//               ),
//             ),
//             RoundButton(
//                 text: "Send code",
//                 onTap: () async {
//                   final credential = PhoneAuthProvider.credential(
//                       verificationId: widget.verificationId,
//                       smsCode: verficationController.text.toString());

//                   try {
//                     await auth.signInWithCredential(credential);
//                   } catch (e) {
//                     Utils().toastMessage(e.toString());
//                   }
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
