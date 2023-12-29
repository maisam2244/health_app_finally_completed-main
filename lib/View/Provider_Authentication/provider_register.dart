// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:health/Resources/Button/mybutton.dart';
// import 'package:health/Resources/Designation_Dropdown/dropdown.dart';
// import 'package:health/Resources/TextField/MyTextField.dart';
// import 'package:health/Resources/Utils/utils.dart';
// import 'package:health/View/Service%20Provider/Provider_home/service_provider_home.dart';

// class Designation extends StatefulWidget {
//   const Designation({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<Designation> createState() => _DesignationState();
// }

// class _DesignationState extends State<Designation> {
//   final nameControlLer = TextEditingController();

//   final emailControlLer = TextEditingController();

//   final designationController = TextEditingController();

//   final passwordController = TextEditingController();

//   final idNumberController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   final _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage("assets/logo/harees_logo.png"),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "Joining as a Service Provider".tr,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       MyTextField(
//                           controller: nameControlLer,
//                           obscureText: false,
//                           labelText: "Name".tr,
//                           conditionText: "Name required".tr),
//                       MyTextField(
//                           controller: emailControlLer,
//                           obscureText: false,
//                           labelText: "email".tr,
//                           conditionText: "Email required".tr),
//                       MyTextField(
//                           controller: passwordController,
//                           obscureText: true,
//                           labelText: "password".tr,
//                           conditionText: "Password required".tr),
//                       MyDropdown(),
//                       MyTextField(
//                           controller: idNumberController,
//                           obscureText: false,
//                           labelText: "ID CARD Number".tr,
//                           conditionText: "ID Number required".tr),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       RoundButton(
//                           text: "Login".tr,
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               _auth
//                                   .createUserWithEmailAndPassword(
//                                       email: emailControlLer.text,
//                                       password: passwordController.text)
//                                   .then((value) {
//                                 Utils()
//                                     .toastMessage(value.user!.email.toString());
//                                 Get.to(() => Service_Provider_Home(userEmail: value.user!.email.toString()));
//                               }).onError((error, stackTrace) {
//                                 Utils().toastMessage(error.toString());
//                               });
//                             }
//                           }),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/ui_helper.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Google_Auth/auth_service.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/Resources/TextField/MyTextField.dart';
import 'package:health/View/Provider_Authentication/provider_complete_profile.dart';
import 'package:health/View/Provider_Authentication/provider_login.dart';

class Provider_Register extends StatefulWidget {
  const Provider_Register({Key? key}) : super(key: key);

  @override
  _Provider_RegisterState createState() => _Provider_RegisterState();
}

class _Provider_RegisterState extends State<Provider_Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || password == "" || cPassword == "") {
      print("Please fill all the fields");
    } else if (password != cPassword) {
      print("The passwords you entered do not match!");
    } else {
      signUp(email, password);
    }
  }

  void signUp(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Creating new account..");

    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      Navigator.pop(context);
      print(ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;
      UserModel newUser = UserModel(
        uid: uid,
        email: email,
        fullname: "",
        profilePic: "",
      );

      // Add user to "Registered Users" collection
      await FirebaseFirestore.instance
          .collection("Registered Users")
          .doc(uid)
          .set(newUser.tomap())
          .then((value) {
        print("New User Created in 'Registered Users' collection!");
      });

      // Add user to "Registered Providers" collection
      await FirebaseFirestore.instance
          .collection("Registered Providers")
          .doc(uid)
          .set(newUser.tomap())
          .then((value) {
        print("New User Created in 'Registered Providers' collection!");
      });

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CompleteProfileProvider(
                userModel: newUser, firebaseUser: credential!.user!);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        "assets/logo/harees_logo.png",
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: emailController,
                      obscureText: false,
                      labelText: "Email Address",
                      conditionText: "Email Address cannot be empty"),
                  MyTextField(
                      controller: passwordController,
                      obscureText: true,
                      labelText: "Password",
                      conditionText: "Password cannot be empty"),
                  MyTextField(
                      controller: cPasswordController,
                      obscureText: true,
                      labelText: "Confirm Password",
                      conditionText: "Password cannot be empty"),
                  SizedBox(height: 20),
                  RoundButton(
                      text: "Sign Up",
                      onTap: () {
                        checkValues();
                      }),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already a User?".tr,
              style: TextStyle(fontSize: 16),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Provider_login()));
              },
              child: Text(
                "Let's Login".tr,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
