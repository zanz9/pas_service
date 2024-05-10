import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница пользователя'),
      ),
      body: Center(child: Text(id)),
    );
  }
}
