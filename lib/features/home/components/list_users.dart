import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/models/iuser.dart';

import 'user_card.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  bool isLoaded = false;
  List<IUser> users = [];

  var sort = 'professional';

  getAllUsers() async {
    var db = FirebaseFirestore.instance;
    final usersDocs =
        await db.collection('users').where('isAdmin', isNotEqualTo: true).get();
    users = [];
    for (var doc in usersDocs.docs) {
      var data = doc.data();
      IUser user = IUser(email: doc.id).fromFirestore(data);
      users.add(user);
    }
    switch (sort) {
      case 'professional':
        users.sort(
            (IUser a, IUser b) => b.professional.compareTo(a.professional));
        break;
      case 'personal':
        users.sort((IUser a, IUser b) => b.personal.compareTo(a.personal));
        break;
      case 'business':
        users.sort((IUser a, IUser b) => b.business.compareTo(a.business));
        break;
      case 'integral':
        users.sort((IUser a, IUser b) => b.integral.compareTo(a.integral));
        break;
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              const Text('Сортировка по: '),
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'professional',
                    child: Text('Профессиональные'),
                  ),
                  DropdownMenuItem(
                    value: 'personal',
                    child: Text('Личностные'),
                  ),
                  DropdownMenuItem(
                    value: 'business',
                    child: Text('Деловые'),
                  ),
                  DropdownMenuItem(
                    value: 'integral',
                    child: Text('Интегральные'),
                  ),
                ],
                value: sort,
                onChanged: (v) {
                  setState(() {
                    sort = v!;
                    getAllUsers();
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              var user = users[index];
              double sortValue;
              switch (sort) {
                case 'professional':
                  sortValue = user.professional;
                  break;
                case 'personal':
                  sortValue = user.personal;
                  break;
                case 'business':
                  sortValue = user.business;
                  break;
                default:
                  sortValue = user.integral;
                  break;
              }
              return UserCard(
                lastName: user.lastName,
                firstName: user.firstName,
                email: user.email,
                sortValue: sortValue,
              );
            },
          ),
        ),
      ],
    );
  }
}
