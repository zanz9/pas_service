import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/components/criteria_list.dart';
import 'package:pas_service/features/user/models/criteria.dart';
import 'package:pas_service/features/user/models/iuser.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.currentUser});
  final User currentUser;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoaded = false;
  late IUser user;
  ICriteria criteria = ICriteria();

  getValuesFromId() async {
    var db = FirebaseFirestore.instance;

    user = IUser(email: widget.currentUser.email!);
    final userData = await db.collection('users').doc(user.email).get();
    user = user.fromFirestore(userData.data()!);

    final criteriaDocs = await db.collection('criteria').doc(user.email).get();
    final criteriaData = criteriaDocs.data();
    criteria = criteria.fromFirestore(criteriaData ?? {});

    isLoaded = true;
    setState(() {});
  }

  onSubmitToChangeState() async {
    isLoaded = false;
    setState(() {});

    var db = FirebaseFirestore.instance;
    user.state = true;
    await db.collection('users').doc(user.email).set(user.toFirestore());

    isLoaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getValuesFromId();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    var theme = Theme.of(context);
    return ListView(
      children: [
        const SizedBox(height: 24),
        CircleAvatar(
          radius: 64,
          child: Text(
            user.lastName[0] + user.firstName[0],
            style: theme.textTheme.displayMedium,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            Text(
              '${user.lastName} ${user.firstName}',
              style: theme.textTheme.titleMedium,
            ),
            Text(
              user.state
                  ? 'Уже подана заявка на оценку'
                  : 'Не подана заявка на оценку',
              style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.hintColor, fontWeight: FontWeight.normal),
            ),
            if (!user.state)
              ElevatedButton(
                onPressed: onSubmitToChangeState,
                child: const Text('Подать завку на оценку'),
              )
          ],
        ),
        const Divider(),
        CriteriaList(criteria: criteria)
      ],
    );
  }
}
