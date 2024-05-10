import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/home/components/list_users.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = false;
    getCurrentUser() async {
      final user = FirebaseAuth.instance.currentUser;
      var db = FirebaseFirestore.instance;
      final userData = await db.collection('users').doc(user?.email).get();
      final data = userData.data();
      isAdmin = data?['isAdmin'] ?? false;
    }

    getCurrentUser();
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
      body: const ListUsers(),
    );
  }
}
