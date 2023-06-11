import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hdflix/login/main_page.dart';
import 'login/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}