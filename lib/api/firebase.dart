import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'userinfo.dart';

class FirebaseSystem {
  Future<void> signIn(Userinfo userInfo) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userInfo.email,
        password: userInfo.password,
      );

      // Retrieve user info from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userInfo.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        Userinfo retrievedUserInfo = Userinfo(
          uid: userData['uid'],
          password: userData['password'],
          firstName: userData['first name'],
          lastName: userData['last name'],
          email: userData['email'],
          age: userData['age'],
        );

        saveUserInfoToPrefs(retrievedUserInfo);
      } else {
        print(
            'No user document found in Firestore for email: ${userInfo.email}');
      }
    } catch (e) {
      print('Sign-in error: $e');
      throw e;
    }
  }

  Future<void> signUp(Userinfo userInfo) async {
    try {
      // Create user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userInfo.email,
        password: userInfo.password,
      );

      // Add user details
      if (userCredential.user != null) {
        userInfo.uid = userCredential.user!.uid;
        addUserDetails(
          userCredential.user!.uid,
          userInfo.firstName,
          userInfo.lastName,
          userInfo.email,
          userInfo.age,
        );

        // Save user info to shared preferences
        saveUserInfoToPrefs(userInfo);
      }
    } catch (e) {
      // Handle sign-up error
      print('Sign-up error: $e');
      throw e;
    }
  }

  Future<void> addUserDetails(String uid, String firstName, String lastName,
      String email, int age) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'uid': uid,
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'age': age,
      });
    } catch (e) {
      // Handle adding user details error
      print('Adding user details error: $e');
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      // Handle sign-out error
      print('Sign-out error: $e');
      throw e;
    }
  }

  Future<void> saveUserInfoToPrefs(Userinfo userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('uid', userInfo.uid);
    await prefs.setString('firstName', userInfo.firstName);
    await prefs.setString('lastName', userInfo.lastName);
    await prefs.setString('email', userInfo.email);
    await prefs.setInt('age', userInfo.age);
  }
}
