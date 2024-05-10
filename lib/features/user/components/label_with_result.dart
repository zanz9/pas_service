import 'package:flutter/material.dart';

class LabelWithResult extends StatelessWidget {
  const LabelWithResult({super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text1),
            Text(text2),
          ],
        ),
      ),
    );
  }
}
