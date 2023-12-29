class UserModel {
  String? fullname;
  String? email;
  String? uid;
  String? profilePic;
  String? experience; // Change 'designation' to 'experience'

  UserModel(
      {this.fullname, this.email, this.uid, this.profilePic, this.experience});

  UserModel.frommap(Map<String, dynamic> map) {
    uid = map['uid'];
    email = map['email'];
    fullname = map['fullname'];
    profilePic = map['profilePic'];
    experience = map['experience']; // Change 'designation' to 'experience'
  }

  Map<String, dynamic> tomap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'profilePic': profilePic,
      'experience': experience, // Change 'designation' to 'experience'
    };
  }
}
