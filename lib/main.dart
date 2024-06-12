import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/generated/l10n.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:pas_service/router.dart';
import 'package:pas_service/theme.dart';

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

  runApp(
    MyApp(
      router: appRouter,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale locale = const Locale('ru');

  void setLocale(Locale value) {
    setState(() {
      locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Employee Experience',
      theme: themeLight,
      routerConfig: widget.router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
