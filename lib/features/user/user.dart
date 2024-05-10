import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/iuser.dart';

import 'components/criteria_widget.dart';
import 'components/label_with_result.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.id});
  final String id;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoaded = false;
  IUser? user;

  Map<String, Map<String, double>> criteria = {'professional': {}};

  setCriteria(key1, key2, value) {
    criteria[key1]![key2] = value;
    setState(() {});
  }

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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница пользователя'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(onPressed: () {}, child: const Text('asdsd')),
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
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Критерий оценки',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                const CriteriaWidget(
                  headtext: 'Профессиональные качества',
                  labels: Column(
                    children: [
                      LabelWithResult(text1: 'Знания', text2: '2/10'),
                      LabelWithResult(text1: 'Умения', text2: '1/10'),
                      LabelWithResult(text1: 'Навыки', text2: '1/10'),
                      LabelWithResult(
                          text1: 'Проффесиональный опыт', text2: '1/10'),
                      LabelWithResult(text1: 'Квалификация', text2: '1/10'),
                      LabelWithResult(text1: 'Результаты труда', text2: '1/10'),
                    ],
                  ),
                ),
                const CriteriaWidget(
                  headtext: 'Личностные характеристики',
                  labels: Column(
                    children: [LabelWithResult(text1: 'text1', text2: 'text2')],
                  ),
                )
              ],
            ),
    );
  }
}

class LabelWithSlider extends StatefulWidget {
  const LabelWithSlider(
      {super.key, required this.value, this.onChanged, required this.text});
  final String text;
  final double value;
  final Function(double)? onChanged;

  @override
  State<LabelWithSlider> createState() => _LabelWithSliderState();
}

class _LabelWithSliderState extends State<LabelWithSlider> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(widget.text, style: theme.textTheme.labelLarge),
        Slider(
          value: widget.value,
          onChanged: widget.onChanged,
          max: 10,
          min: 0,
          divisions: 10,
          label: widget.value.toInt().toString(),
        ),
      ],
    );
  }
}
