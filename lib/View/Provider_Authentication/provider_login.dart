// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:health/Resources/Button/mybutton.dart';
// import 'package:health/Resources/TextField/MyTextField.dart';
// import 'package:health/Resources/Utils/utils.dart';
// import 'package:health/View/Service%20Provider/Provider_home/service_provider_home.dart';
//
// class Provider_login extends StatefulWidget {
//   Provider_login({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Provider_login> createState() => _Provider_loginState();
// }

// class _Provider_loginState extends State<Provider_login> {
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
//                 text: "Login".tr,
//                 onTap: () {
//                   if (_FormKey.currentState!.validate()) {
//                     _auth
//                         .signInWithEmailAndPassword(
//                             email: emailController.text.toString(),
//                             password: passwordController.text.toString())

//                     //     .then((value) {
//                     //   Utils().toastMessage(value.user!.email.toString());
//                     //   Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //           builder: (context) => Service_Provider_Home()));
//                     // })

//                         .then((value) {
//                           Utils().toastMessage(value.user!.email.toString());
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Service_Provider_Home(userEmail: value.user!.email.toString()),
//                             ),
//                           );
//                         })

//                     .onError((error, stackTrace) {
//                       Utils().toastMessage(error.toString());
//                     });
//                   }
//                 }),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  Text(
//                   "Not a provider?".tr,
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Designation()));
//                     },
//                     child: Text("Register Now".tr,
//                         style: TextStyle(fontSize: 20)))
//               ],
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:health/Resources/Button/mybutton.dart';
// import 'package:health/Resources/TextField/MyTextField.dart';
// import 'package:health/Resources/Utils/utils.dart';
// import 'package:health/Video_Call/joincall.dart';
// import 'package:health/View/User_Authentication/user_register.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
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
//                 text: "Login".tr,
//                 onTap: () {
//                   if (_FormKey.currentState!.validate()) {
//                     _auth
//                         .signInWithEmailAndPassword(
//                             email: emailController.text.toString(),
//                             password: passwordController.text.toString())

//                     //     .then((value) {
//                     //   Utils().toastMessage(value.user!.email.toString());
//                     //   Navigator.push(context,
//                     //       MaterialPageRoute(builder: (context) => HomePage()));

//                     // })

//                     .then((value) {
//                       Utils().toastMessage(value.user!.email.toString());
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => JoinCall(userEmail: value.user!.email.toString()),
//                         ),
//                       );
//                     })

//                     .onError((error, stackTrace) {
//                       Utils().toastMessage(error.toString());
//                     });
//                   }
//                 }),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  Text(
//                   "Not a member?".tr,
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => RegisterPage()));
//                     },
//                     child: Text("Register Now".tr,
//                         style: TextStyle(fontSize: 20)))
//               ],
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/Chat_App/Models/ui_helper.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Google_Auth/auth_service.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/Resources/TextField/MyTextField.dart';
import 'package:health/View/Provider_Authentication/provider_register.dart';
import 'package:health/View/Provider_Pages/Provider_home/service_provider_home.dart';

class Provider_login extends StatefulWidget {
  const Provider_login({Key? key}) : super(key: key);

  @override
  _Provider_loginState createState() => _Provider_loginState();
}

class _Provider_loginState extends State<Provider_login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {
      print("Please fill all the fields");
    } else {
      logIn(email, password);
    }
  }

  void logIn(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Logging In..");

    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      Navigator.pop(context);

      print(ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection("Registered Users")
          .doc(uid)
          .get();
      UserModel userModel =
          UserModel.frommap(userData.data() as Map<String, dynamic>);

      // Go to HomePage
      print("Log In Successful!");

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Service_Provider_Home(
            userModel: userModel,
            firebaseUser: credential!.user!,
            userEmail: '',
          );
        }),
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
                    backgroundImage: AssetImage("assets/logo/harees_logo.png"),
                  ),
                  Text(
                    "Harees",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: emailController,
                      obscureText: false,
                      labelText: "Email Address",
                      conditionText: "Email Address cannot be empty"),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: passwordController,
                      obscureText: true,
                      labelText: "Password",
                      conditionText: "Password cannot be empty"),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      text: "Log In",
                      onTap: () {
                        checkValues();
                      }),
                  SizedBox(
                    height: 25,
                  ),
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
              "Don't have an account?",
              style: TextStyle(fontSize: 16),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Provider_Register();
                  }),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
