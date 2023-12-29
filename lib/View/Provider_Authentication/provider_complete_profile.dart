import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/Chat_App/Models/ui_helper.dart';
import 'package:health/Chat_App/Models/user_models.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/View/Provider_Pages/Provider_home/service_provider_home.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileProvider extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const CompleteProfileProvider(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<CompleteProfileProvider> createState() =>
      _CompleteProfileProviderState();
}

class _CompleteProfileProviderState extends State<CompleteProfileProvider> {
  File? imageFile;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = (await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 40,
    ));

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload Profile Picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.gallery);
                  },
                  leading: Icon(Icons.photo_album),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.camera);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a photo"),
                ),
              ],
            ),
          );
        });
  }

  void checkValues() {
    String fullname = fullNameController.text.trim();
    String experience = experienceController.text.trim();

    if (fullname == "" || imageFile == null || experience == "") {
      print("Please fill all the fields");
      UIHelper.showAlertDialog(context, "Incomplete Data",
          "Please fill all the fields and upload a profile picture");
    } else {
      log("Uploading data..");
      uploadData();
    }
  }

  void uploadData() async {
    UIHelper.showLoadingDialog(context, "Uploading image..");

    // Upload image file to Firebase Storage
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("Profile Pictures")
        .child(widget.userModel.uid.toString())
        .putFile(imageFile!);

    TaskSnapshot snapshot = await uploadTask;

    // Get the download URL of the uploaded image
    String? imageUrl = await snapshot.ref.getDownloadURL();
    String? fullname = fullNameController.text.trim();
    String? experience = experienceController.text.trim();

    // Update UserModel with new data
    widget.userModel.fullname = fullname;
    widget.userModel.profilePic = imageUrl;
    widget.userModel.experience = experience;

    // Update "Registered Users" collection
    await FirebaseFirestore.instance
        .collection("Registered Users")
        .doc(widget.userModel.uid)
        .set(widget.userModel.tomap())
        .then((value) {
      log("Data uploaded to 'Registered Users'!");
    });

    // Add data to "Registered Providers" collection
    await FirebaseFirestore.instance
        .collection("Registered Providers")
        .doc(widget.userModel.uid)
        .set(widget.userModel.tomap())
        .then((value) {
      log("Data uploaded to 'Registered Providers'!");
    });

    // Navigate to the next screen
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return Service_Provider_Home(
          userModel: widget.userModel,
          firebaseUser: widget.firebaseUser,
          userEmail: '',
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.purple,
        elevation: 0,
        title: Text("Complete Your Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  showPhotoOptions();
                },
                child: CircleAvatar(
                  backgroundImage:
                      (imageFile != null) ? FileImage(imageFile!) : null,
                  child: (imageFile == null)
                      ? Icon(Icons.person, size: 60, color: Colors.white)
                      : null,
                  backgroundColor: MyColors.purple,
                  radius: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),
              TextField(
                controller: experienceController,
                decoration: InputDecoration(
                  labelText: "Experience",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                  text: "Done!",
                  onTap: () {
                    checkValues();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
