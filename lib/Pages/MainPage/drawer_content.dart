import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Your Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'your_email@example.com',
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
              // Handle Settings tap
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text(
              'Exit',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle Exit tap
            },
          ),
        ],
      ),
    );
  }
}
