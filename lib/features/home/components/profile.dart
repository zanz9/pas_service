import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/components/criteria_list.dart';
import 'package:pas_service/features/user/models/criteria.dart';
import 'package:pas_service/features/user/models/iuser.dart';
import 'package:pas_service/generated/l10n.dart';
import 'package:pas_service/router.dart';

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
    final userDoc = db.collection('users').doc(user.email);
    userDoc.snapshots().listen((event) {
      user = user.fromFirestore(event.data()!);
      setState(() {});
    });

    final criteriaDocs = await db.collection('criteria').doc(user.email).get();
    final criteriaData = criteriaDocs.data();
    criteria = criteria.fromFirestore(criteriaData ?? {});

    isLoaded = true;
    setState(() {});
  }

  onSubmitToChangeState() async {
    var db = FirebaseFirestore.instance;
    user.state = true;
    await db.collection('users').doc(user.email).set(user.toFirestore());
  }

  goTest() async {
    router.pushNamed(RouterNames.test, pathParameters: {'id': user.email});
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
                  ? S.of(context).profile_stateTrue
                  : S.of(context).profile_stateFalse,
              style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.hintColor, fontWeight: FontWeight.normal),
            ),
            if (!user.state)
              ElevatedButton(
                onPressed: goTest,
                child: Text(S.of(context).profile_onClickState),
              )
          ],
        ),
        const Divider(),
        user.firstTime
            ? const SizedBox()
            : CriteriaList(criteria: criteria, user: user)
      ],
    );
  }
}
