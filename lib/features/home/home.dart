import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/home/components/list_users.dart';
import 'package:pas_service/generated/l10n.dart';
import 'package:pas_service/main.dart';

import 'components/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoaded = false;
  bool isAdmin = false;
  User? user = FirebaseAuth.instance.currentUser;

  getCurrentUser() async {
    var db = FirebaseFirestore.instance;
    final userData = await db.collection('users').doc(user!.email).get();
    final data = userData.data();
    isAdmin = data?['isAdmin'] ?? false;
    isLoaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).home),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
            )
          ],
          leading: IconButton(
            onPressed: () {
              if (MyApp.of(context)!.locale == const Locale('ru')) {
                MyApp.of(context)!.setLocale(const Locale('en'));
              } else {
                MyApp.of(context)!.setLocale(const Locale('ru'));
              }
            },
            icon: const Icon(
              Icons.language,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getCurrentUser();
          },
          child: !isLoaded
              ? const Center(child: CircularProgressIndicator())
              : isAdmin
                  ? const ListUsers()
                  : Profile(currentUser: user!),
        ));
  }
}
