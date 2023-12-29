import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health/Chat_App/Models/user_models.dart';

class FirebaseHelper {

  static Future<UserModel?> getUserModelById(String uid) async {
    UserModel? userModel;

    DocumentSnapshot docSnap = await FirebaseFirestore.instance.collection("Registered Users").doc(uid).get();
    DocumentSnapshot docSnap1 = await FirebaseFirestore.instance.collection("Registered Providers").doc(uid).get();


    if(docSnap.data() != null) {
      userModel = UserModel.frommap(docSnap.data() as Map<String, dynamic>);
    }

    if(docSnap1.data() != null) {
      userModel = UserModel.frommap(docSnap1.data() as Map<String, dynamic>);
    }

    return userModel;
  }

}