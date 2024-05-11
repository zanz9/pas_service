import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/features/user/models/iuser.dart';
import 'package:pas_service/router.dart';

import 'components/criteria_list.dart';
import 'components/user_field.dart';
import 'models/criteria.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.id});
  final String id;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoaded = false;
  IUser? user;
  ICriteria criteria = ICriteria();

  @override
  void initState() {
    super.initState();
    getValuesFromId();
  }

  getValuesFromId() async {
    var db = FirebaseFirestore.instance;

    final userDocs = await db.collection('users').doc(widget.id).get();
    final data = userDocs.data();
    user = IUser(email: widget.id).fromFirestore(data!);

    final criteriaDocs = await db.collection('criteria').doc(widget.id).get();
    final criteriaData = criteriaDocs.data();
    criteria = criteria.fromFirestore(criteriaData ?? {});

    isLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница пользователя'),
      ),
      bottomNavigationBar: !isLoaded
          ? null
          : BottomAppBar(
              height: 70,
              child: user!.state
                  ? ElevatedButton(
                      onPressed: () async {
                        final bool? onRefresh = await context.pushNamed(
                          RouterNames.validate,
                          pathParameters: {'id': user!.email},
                        );
                        if (onRefresh == true) {
                          getValuesFromId();
                        }
                      },
                      child: const Text('Начать оценку'),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Этот пользователь не нуждается в оценке',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
            ),
      body: !isLoaded
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                UserField(user: user),
                CriteriaList(criteria: criteria),
              ],
            ),
    );
  }
}
