import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Starter',
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
