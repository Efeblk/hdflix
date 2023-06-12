import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            buildSettingItem(
              icon: Icons.notifications,
              title: 'Receive Notifications',
              subtitle: 'Enable or disable notifications',
            ),
            buildSettingItem(
              icon: Icons.volume_up,
              title: 'Sound',
              subtitle: 'Toggle sound effects',
            ),
            buildSettingItem(
              icon: Icons.vibration,
              title: 'Vibration',
              subtitle: 'Toggle vibration effects',
            ),
            SizedBox(height: 24.0),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            buildSettingItem(
              icon: Icons.person,
              title: 'Edit Profile',
              subtitle: 'Update your account information',
            ),
            buildSettingItem(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'Change your account password',
            ),
            SizedBox(height: 24.0),
            Text(
              'Privacy Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            buildSettingItem(
              icon: Icons.visibility,
              title: 'Hide Online Status',
              subtitle: 'Prevent others from seeing your online status',
            ),
            buildSettingItem(
              icon: Icons.delete,
              title: 'Delete Account',
              subtitle: 'Permanently delete your account',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingItem(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        // Handle setting item tap
      },
    );
  }
}
