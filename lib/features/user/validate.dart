import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/components/label_with_slider.dart';
import 'package:pas_service/features/user/components/user_field.dart';
import 'package:pas_service/features/user/models/criteria.dart';
import 'package:pas_service/router.dart';

import 'components/criteria_widget.dart';
import 'models/iuser.dart';

class Validate extends StatefulWidget {
  const Validate({super.key, required this.id});
  final String id;

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
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

  saveValuesToDatabase() async {
    if (!isLoaded) return;

    isLoaded = false;
    setState(() {});

    var db = FirebaseFirestore.instance;
    await db.collection('criteria').doc(widget.id).set(criteria.toFirestore());

    user!.business = criteria.business.getAVG();
    user!.integral = criteria.integral.getAVG();
    user!.professional = criteria.professional.getAVG();
    user!.personal = criteria.personal.getAVG();
    user!.state = false;
    user!.firstTime = false;

    await db.collection('users').doc(widget.id).set(user!.toFirestore());

    isLoaded = true;
    setState(() {});
    router.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оценка пользователя'),
        actions: [
          IconButton(
            onPressed: saveValuesToDatabase,
            icon: const Icon(Icons.save),
          )
        ],
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
                  avgValue: user!.professional,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: 'Знания',
                        value: criteria.professional.knowledge,
                        onChanged: (value) => (setState(() {
                          criteria.professional.knowledge = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Умения',
                        value: criteria.professional.ability,
                        onChanged: (value) => (setState(() {
                          criteria.professional.ability = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Навыки',
                        value: criteria.professional.skills,
                        onChanged: (value) => (setState(() {
                          criteria.professional.skills = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Проффесиональный опыт',
                        value: criteria.professional.experience,
                        onChanged: (value) => (setState(() {
                          criteria.professional.experience = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Квалификация',
                        value: criteria.professional.qualification,
                        onChanged: (value) => (setState(() {
                          criteria.professional.qualification = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Результаты труда',
                        value: criteria.professional.resultOfWork,
                        onChanged: (value) => (setState(() {
                          criteria.professional.resultOfWork = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Личные качества',
                  avgValue: user!.personal,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: 'Способность к самооценке',
                        value: criteria.personal.theAbilityToSelfEsteem,
                        onChanged: (value) => (setState(() {
                          criteria.personal.theAbilityToSelfEsteem = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Нравственность',
                        value: criteria.personal.morality,
                        onChanged: (value) => (setState(() {
                          criteria.personal.morality = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Честность',
                        value: criteria.personal.honesty,
                        onChanged: (value) => (setState(() {
                          criteria.personal.honesty = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Справедливость',
                        value: criteria.personal.justice,
                        onChanged: (value) => (setState(() {
                          criteria.personal.justice = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Психологическая уствойчивость',
                        value: criteria.personal.psychologicalStability,
                        onChanged: (value) => (setState(() {
                          criteria.personal.psychologicalStability = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Деловые качества',
                  avgValue: user!.business,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: 'Организованность',
                        value: criteria.business.organization,
                        onChanged: (value) => (setState(() {
                          criteria.business.organization = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Ответственность',
                        value: criteria.business.responsibility,
                        onChanged: (value) => (setState(() {
                          criteria.business.responsibility = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Инициативность',
                        value: criteria.business.initiative,
                        onChanged: (value) => (setState(() {
                          criteria.business.initiative = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Предприимчивость',
                        value: criteria.business.enterprise,
                        onChanged: (value) => (setState(() {
                          criteria.business.enterprise = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: 'Интегральные качества',
                  avgValue: user!.integral,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: 'Авторитет',
                        value: criteria.integral.authority,
                        onChanged: (value) => (setState(() {
                          criteria.integral.authority = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Культура',
                        value: criteria.integral.culture,
                        onChanged: (value) => (setState(() {
                          criteria.integral.culture = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Мышление',
                        value: criteria.integral.thinking,
                        onChanged: (value) => (setState(() {
                          criteria.integral.thinking = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: 'Речь',
                        value: criteria.integral.speech,
                        onChanged: (value) => (setState(() {
                          criteria.integral.speech = value;
                        })),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
