import 'package:go_router/go_router.dart';
import 'package:pas_service/features/auth/login/login.dart';
import 'package:pas_service/features/auth/register/register.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/login',
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
);
