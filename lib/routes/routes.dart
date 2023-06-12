import 'package:go_router/go_router.dart';
import 'package:hdflix/Pages/MainPage/netflixhomepage.dart';
import 'package:hdflix/Pages/MainPage/settings/settings_screen.dart';
import 'package:hdflix/login/auth_page.dart';
import 'package:hdflix/login/main_page.dart';
import 'package:hdflix/profile.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    // Loader Screen
    GoRoute(
      path: '/',
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => NetflixHomePage(),
    ),
    // User Screens
    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
    ),
  ],
);
