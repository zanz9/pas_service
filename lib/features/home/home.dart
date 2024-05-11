import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/home/components/list_users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAdmin = false;
  getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    var db = FirebaseFirestore.instance;
    final userData = await db.collection('users').doc(user?.email).get();
    final data = userData.data();
    isAdmin = data?['isAdmin'] ?? false;
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
          title: const Text('Персоналды бағалау жүйесі'),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: isAdmin ? const ListUsers() : const Text("Yor're not admin"),
        ));
  }
}
