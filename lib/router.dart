import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/features/auth/login/login.dart';
import 'package:pas_service/features/auth/register/register.dart';
import 'package:pas_service/features/home/home.dart';
import 'package:pas_service/features/user/user.dart';

class RouterNames {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/';
  static const String user = '/user';
}

final router = GoRouter(
  routes: [
    GoRoute(
      name: RouterNames.home,
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      name: RouterNames.user,
      path: '/user/:id',
      builder: (context, state) => UserPage(id: state.pathParameters['id']!),
    ),
    GoRoute(
      name: RouterNames.login,
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      name: RouterNames.register,
      path: '/register',
      builder: (context, state) => const Register(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    final bool isNotLogin = FirebaseAuth.instance.currentUser == null;
    if ((isNotLogin && state.matchedLocation != '/login') &&
        (isNotLogin && state.matchedLocation != '/register')) {
      return '/login';
    }
    if (!isNotLogin && state.matchedLocation == '/login') {
      return '/';
    }
    if (!isNotLogin && state.matchedLocation == '/register') {
      return '/';
    }
    return null;
  },
);
