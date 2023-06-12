import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userinfo.dart';

class FirebaseSystem {
  Future signUp(Userinfo userInfo) async {
    // create user
    User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userInfo.email,
      password: userInfo.password,
    ))
        .user!;
    // add user details
    if (user != null) {
      userInfo.uid = user.uid;
      addUserDetails(
        user.uid,
        userInfo.firstName,
        userInfo.lastName,
        userInfo.email,
        userInfo.age,
      );
    }
  }

  Future addUserDetails(String uid, String firstName, String lastName,
      String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'uid': uid,
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }
}
