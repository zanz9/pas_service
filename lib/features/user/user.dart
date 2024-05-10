import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pas_service/features/user/iuser.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.id});
  final String id;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoaded = false;
  IUser? user;

  @override
  void initState() {
    super.initState();
    getValuesFromId();
  }

  getValuesFromId() async {
    var db = FirebaseFirestore.instance;
    final userDocs = await db.collection('users').doc(widget.id).get();
    final data = userDocs.data();
    user = IUser(
      email: widget.id,
      firstName: data!['firstName'],
      lastName: data['lastName'],
    );
    isLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница пользователя'),
      ),
      body: !isLoaded
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(user!.lastName[0] + user!.firstName[0]),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user!.lastName} ${user!.firstName}'),
                        Text(user!.email),
                      ],
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
