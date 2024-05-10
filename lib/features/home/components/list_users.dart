import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'user_card.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  bool isLoaded = false;
  var users = [];

  getAllUsers() async {
    var db = FirebaseFirestore.instance;
    final usersDocs =
        await db.collection('users').where('isAdmin', isNotEqualTo: true).get();
    for (var doc in usersDocs.docs) {
      var data = doc.data();
      users.add({
        'id': doc.id,
        'firstName': data['firstName'],
        'lastName': data['lastName']
      });
    }
    isLoaded = true;
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        var user = users[index];
        String firstName = user['firstName'];
        String lastName = user['lastName'];
        String email = user['id'];
        return UserCard(lastName: lastName, firstName: firstName, email: email);
      },
    );
  }
}
