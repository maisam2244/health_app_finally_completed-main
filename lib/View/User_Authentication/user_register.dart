// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:health/Resources/Button/mybutton.dart';
// import 'package:health/Resources/TextField/MyTextField.dart';
// import 'package:health/Resources/Utils/utils.dart';
// import 'package:health/Video_Call/joincall.dart';
// import 'package:health/View/User_Authentication/Login_page.dart';

// class RegisterPage extends StatefulWidget {
//   RegisterPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _FormKey = GlobalKey<FormState>();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             Container(
//                 height: 200,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: CircleAvatar(
//                     backgroundImage:
//                         AssetImage("assets/logo/harees_logo.png"))),
//             const SizedBox(
//               height: 40,
//             ),
//             Form(
//                 key: _FormKey,
//                 child: Column(children: [
//                   MyTextField(
//                       controller: emailController,
//                       obscureText: false,
//                       labelText: "Email".tr,
//                       conditionText: "Email cannot be empty".tr),
//                   MyTextField(
//                       controller: passwordController,
//                       obscureText: true,
//                       labelText: "Password".tr,
//                       conditionText: "Password cannot be empty".tr),
//                 ])),
//             const SizedBox(height: 50),
//             RoundButton(
//                 text: "Register".tr,
//                 onTap: () async {
//                   if (_FormKey.currentState!.validate()) {
//                     try {
//                       await _auth.createUserWithEmailAndPassword(
//                         email: emailController.text,
//                         password: passwordController.text,
//                       );
//                       // User creation was successful, navigate to the home page or show a success message.
//                       Utils().toastMessage("Account created successfully".tr);
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => JoinCall(userEmail: emailController.text)));
//                     } on FirebaseAuthException catch (e) {
//                       // Handle FirebaseAuthException
//                       if (e.code == 'email-already-in-use') {
//                         Get.snackbar("Error".tr,
//                             "The email address is already in use by another account.".tr);
//                       } else if (e.code == 'weak-password') {
//                         Get.snackbar(
//                             "Error", "The password provided is too weak.".tr);
//                       } else {
//                         Get.snackbar(
//                             "Error".tr,
//                             e.message ??
//                                 "An error occurred while creating the account.".tr);
//                       }
//                     } catch (e) {
//                       // Handle other exceptions
//                       Get.snackbar("Error".tr, e.toString());
//                     }
//                   }
//                 }),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  Text(
//                   "Already a member?".tr,
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()));
//                     },
//                     child: Text("Let's login".tr,
//                         style: TextStyle(fontSize: 20)))
//               ],
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health/Chat_App/Models/ui_helper.dart';
import 'package:health/Chat_App/Pages/Complete_Profile_User.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Google_Auth/auth_service.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/Resources/TextField/MyTextField.dart';
import 'package:health/View/User_Authentication/user_login.dart';

class User_Register extends StatefulWidget {
  const User_Register({Key? key}) : super(key: key);

  @override
  _User_RegisterState createState() => _User_RegisterState();
}

class _User_RegisterState extends State<User_Register> {
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
      UserModel newUser =
          UserModel(uid: uid, email: email, fullname: "", profilePic: "");
      await FirebaseFirestore.instance
          .collection("Registered Users")
          .doc(uid)
          .set(newUser.tomap())
          .then((value) {
        print("New User Created!");
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return CompleteProfile(
                userModel: newUser, firebaseUser: credential!.user!);
          }),
        );
      });
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
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            backgroundImage:
                                Image.asset("assets/images/google.png").image),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            backgroundImage:
                                Image.asset("assets/images/apple.png").image),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            backgroundImage:
                                Image.asset("assets/images/fb.png").image),
                      )
                    ],
                  )
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
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
