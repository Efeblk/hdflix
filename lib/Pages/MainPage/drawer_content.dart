import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/firebase.dart';

class DrawerContent extends StatefulWidget {
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  final FirebaseSystem _firebaseSystem = FirebaseSystem();
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfoFromPrefs();
  }

  Future<void> _loadUserInfoFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('firstName') ?? '';
      _userEmail = prefs.getString('email') ?? '';
    });
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseSystem.signOut();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } catch (e) {
      // Handle sign-out error
      print('Sign-out error: $e');
      // Display an error message or handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              _userName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              _userEmail,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile_picture.jpg',
              ),
            ),
            onDetailsPressed: () => GoRouter.of(context).push("/profile"),
          ),
          Expanded(child: Container()),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              GoRouter.of(context).push("/settings");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text(
              'Exit',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
