import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pas_service/features/user/components/label_with_slider.dart';
import 'package:pas_service/features/user/components/user_field.dart';
import 'package:pas_service/features/user/models/criteria.dart';
import 'package:pas_service/generated/l10n.dart';
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

    await db.collection('backups').add(
      {
        ...criteria.toFirestore(),
        'email': widget.id,
        'date': FieldValue.serverTimestamp(),
      },
    );

    isLoaded = true;
    setState(() {});
    router.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).user_validate),
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
                      S.of(context).user_validate_subHeader,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                CriteriaWidget(
                  headtext: S.of(context).user_professional,
                  avgValue: user!.professional,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: S.of(context).user_professional_knowledge,
                        value: criteria.professional.knowledge,
                        onChanged: (value) => (setState(() {
                          criteria.professional.knowledge = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_professional_ability,
                        value: criteria.professional.ability,
                        onChanged: (value) => (setState(() {
                          criteria.professional.ability = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_professional_skills,
                        value: criteria.professional.skills,
                        onChanged: (value) => (setState(() {
                          criteria.professional.skills = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_professional_experience,
                        value: criteria.professional.experience,
                        onChanged: (value) => (setState(() {
                          criteria.professional.experience = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_professional_qualifications,
                        value: criteria.professional.qualification,
                        onChanged: (value) => (setState(() {
                          criteria.professional.qualification = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_professional_resultOfWork,
                        value: criteria.professional.resultOfWork,
                        onChanged: (value) => (setState(() {
                          criteria.professional.resultOfWork = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: S.of(context).user_personal,
                  avgValue: user!.personal,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text:
                            S.of(context).user_personal_theAbilityToSelfEsteem,
                        value: criteria.personal.theAbilityToSelfEsteem,
                        onChanged: (value) => (setState(() {
                          criteria.personal.theAbilityToSelfEsteem = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_personal_morality,
                        value: criteria.personal.morality,
                        onChanged: (value) => (setState(() {
                          criteria.personal.morality = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_personal_honesty,
                        value: criteria.personal.honesty,
                        onChanged: (value) => (setState(() {
                          criteria.personal.honesty = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_personal_justice,
                        value: criteria.personal.justice,
                        onChanged: (value) => (setState(() {
                          criteria.personal.justice = value;
                        })),
                      ),
                      LabelWithSlider(
                        text:
                            S.of(context).user_personal_psychologicalStability,
                        value: criteria.personal.psychologicalStability,
                        onChanged: (value) => (setState(() {
                          criteria.personal.psychologicalStability = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: S.of(context).user_business,
                  avgValue: user!.business,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: S.of(context).user_business_organization,
                        value: criteria.business.organization,
                        onChanged: (value) => (setState(() {
                          criteria.business.organization = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_business_responsibility,
                        value: criteria.business.responsibility,
                        onChanged: (value) => (setState(() {
                          criteria.business.responsibility = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_business_initiative,
                        value: criteria.business.initiative,
                        onChanged: (value) => (setState(() {
                          criteria.business.initiative = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_business_enterprise,
                        value: criteria.business.enterprise,
                        onChanged: (value) => (setState(() {
                          criteria.business.enterprise = value;
                        })),
                      ),
                    ],
                  ),
                ),
                CriteriaWidget(
                  headtext: S.of(context).user_integral,
                  avgValue: user!.integral,
                  labels: Column(
                    children: [
                      LabelWithSlider(
                        text: S.of(context).user_integral_authority,
                        value: criteria.integral.authority,
                        onChanged: (value) => (setState(() {
                          criteria.integral.authority = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_integral_culture,
                        value: criteria.integral.culture,
                        onChanged: (value) => (setState(() {
                          criteria.integral.culture = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_integral_thinking,
                        value: criteria.integral.thinking,
                        onChanged: (value) => (setState(() {
                          criteria.integral.thinking = value;
                        })),
                      ),
                      LabelWithSlider(
                        text: S.of(context).user_integral_speech,
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
