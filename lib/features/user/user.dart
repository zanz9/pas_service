import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/features/user/models/iuser.dart';
import 'package:pas_service/router.dart';

import 'components/criteria_widget.dart';
import 'components/label_with_result.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Критерий оценки',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                CriteriaWidget(
                  headtext: 'Профессиональные качества',
                  labels: Column(
                    children: [
                      LabelWithResult(
                          text1: 'Знания',
                          text2:
                              '${criteria.professional.knowledge.toInt()}/10'),
                      LabelWithResult(
                          text1: 'Умения',
                          text2: '${criteria.professional.ability.toInt()}/10'),
                      LabelWithResult(
                          text1: 'Навыки',
                          text2: '${criteria.professional.skills.toInt()}/10'),
                      LabelWithResult(
                          text1: 'Проффесиональный опыт',
                          text2:
                              '${criteria.professional.experience.toInt()}/10'),
                      LabelWithResult(
                          text1: 'Квалификация',
                          text2:
                              '${criteria.professional.qualification.toInt()}/10'),
                      LabelWithResult(
                          text1: 'Результаты труда',
                          text2:
                              '${criteria.professional.resultOfWork.toInt()}/10'),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Личностные качества',
                  labels: Column(
                    children: [
                      LabelWithResult(
                        text1: 'Способность к самооценке',
                        text2:
                            '${criteria.personal.theAbilityToSelfEsteem.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Нравственность',
                        text2: '${criteria.personal.morality.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Честность',
                        text2: '${criteria.personal.honesty.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Справедливость',
                        text2: '${criteria.personal.justice.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Психологическая уствойчивость',
                        text2:
                            '${criteria.personal.psychologicalStability.toInt()}/10',
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Деловые качества',
                  labels: Column(
                    children: [
                      LabelWithResult(
                        text1: 'Организованность',
                        text2: '${criteria.business.organization.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Ответственность',
                        text2: '${criteria.business.responsibility.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Инициативность',
                        text2: '${criteria.business.initiative.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Предприимчивость',
                        text2: '${criteria.business.enterprise.toInt()}/10',
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Интегральные качества',
                  labels: Column(
                    children: [
                      LabelWithResult(
                        text1: 'Авторитет',
                        text2: '${criteria.integral.authority.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Культура',
                        text2: '${criteria.integral.culture.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Мышление',
                        text2: '${criteria.integral.thinking.toInt()}/10',
                      ),
                      LabelWithResult(
                        text1: 'Речь',
                        text2: '${criteria.integral.speech.toInt()}/10',
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
