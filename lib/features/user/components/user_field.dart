import 'package:flutter/material.dart';

import '../models/iuser.dart';

class UserField extends StatelessWidget {
  const UserField({
    super.key,
    required this.user,
  });

  final IUser? user;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        const Divider(),
      ],
    );
  }
}
