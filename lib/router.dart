import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/features/auth/login/login.dart';
import 'package:pas_service/features/auth/register/register.dart';
import 'package:pas_service/features/home/home.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
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
