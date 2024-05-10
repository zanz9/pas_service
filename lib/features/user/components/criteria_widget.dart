import 'package:flutter/material.dart';

class CriteriaWidget extends StatelessWidget {
  const CriteriaWidget({
    super.key,
    required this.headtext,
    required this.labels,
  });
  final String headtext;
  final Widget labels;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            headtext,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        labels
      ],
    );
  }
}
