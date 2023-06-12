import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  Future signUp() async {
    // create user
    if (passwordConfirmed()) {
      User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      ))
          .user!;
      // add user details
      if (user != null) {
        addUserDetails(
          user.uid,
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),
        );
      }
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
