import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/router.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.sortValue,
  });

  final String lastName;
  final String firstName;
  final String email;
  final double sortValue;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(RouterNames.user, pathParameters: {'id': email});
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$lastName $firstName'),
                  Text(email),
                  Text(sortValue.toStringAsFixed(2)),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: theme.hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
