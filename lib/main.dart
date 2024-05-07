import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter appRouter = router;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    appRouter.refresh();
  });

  WakelockPlus.enable();

  runApp(MyApp(router: appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffEEEEEE),
          centerTitle: true,
          elevation: 5.0,
        ),
        primaryColor: const Color(0xff00ADB5),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
