import 'package:flutter/material.dart';
import 'package:pas_service/features/user/models/iuser.dart';
import 'package:pas_service/generated/l10n.dart';

import '../models/criteria.dart';
import 'criteria_widget.dart';
import 'label_with_result.dart';

class CriteriaList extends StatelessWidget {
  const CriteriaList({
    super.key,
    required this.criteria,
    required this.user,
  });

  final ICriteria criteria;
  final IUser user;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    avgValue() {
      double temp = user.test +
          user.professional +
          user.business +
          user.integral +
          user.personal;
      temp /= 5;
      return temp;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).user_criteria,
              style: theme.textTheme.headlineSmall,
            ),
          ],
        ),
        CriteriaWidget(
          headtext: 'Орташа баға:',
          avgValue: avgValue(),
          labels: Column(
            children: [
              LabelWithResult(
                text1: 'Тестілеу бағасы:',
                text2: '${user.test.toInt()}/10',
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        CriteriaWidget(
          headtext: S.of(context).user_professional,
          avgValue: user.professional,
          labels: Column(
            children: [
              LabelWithResult(
                  text1: S.of(context).user_professional_knowledge,
                  text2: '${criteria.professional.knowledge.toInt()}/10'),
              LabelWithResult(
                  text1: S.of(context).user_professional_ability,
                  text2: '${criteria.professional.ability.toInt()}/10'),
              LabelWithResult(
                  text1: S.of(context).user_professional_skills,
                  text2: '${criteria.professional.skills.toInt()}/10'),
              LabelWithResult(
                  text1: S.of(context).user_professional_experience,
                  text2: '${criteria.professional.experience.toInt()}/10'),
              LabelWithResult(
                  text1: S.of(context).user_professional_qualifications,
                  text2: '${criteria.professional.qualification.toInt()}/10'),
              LabelWithResult(
                  text1: S.of(context).user_professional_resultOfWork,
                  text2: '${criteria.professional.resultOfWork.toInt()}/10'),
            ],
          ),
        ),
        CriteriaWidget(
          headtext: S.of(context).user_personal,
          avgValue: user.personal,
          labels: Column(
            children: [
              LabelWithResult(
                text1: S.of(context).user_personal_theAbilityToSelfEsteem,
                text2: '${criteria.personal.theAbilityToSelfEsteem.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_personal_morality,
                text2: '${criteria.personal.morality.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_personal_honesty,
                text2: '${criteria.personal.honesty.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_personal_justice,
                text2: '${criteria.personal.justice.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_personal_psychologicalStability,
                text2: '${criteria.personal.psychologicalStability.toInt()}/10',
              ),
            ],
          ),
        ),
        CriteriaWidget(
          headtext: S.of(context).user_business,
          avgValue: user.business,
          labels: Column(
            children: [
              LabelWithResult(
                text1: S.of(context).user_business_organization,
                text2: '${criteria.business.organization.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_business_responsibility,
                text2: '${criteria.business.responsibility.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_business_initiative,
                text2: '${criteria.business.initiative.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_business_enterprise,
                text2: '${criteria.business.enterprise.toInt()}/10',
              ),
            ],
          ),
        ),
        CriteriaWidget(
          headtext: S.of(context).user_integral,
          avgValue: user.integral,
          labels: Column(
            children: [
              LabelWithResult(
                text1: S.of(context).user_integral_authority,
                text2: '${criteria.integral.authority.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_integral_culture,
                text2: '${criteria.integral.culture.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_integral_thinking,
                text2: '${criteria.integral.thinking.toInt()}/10',
              ),
              LabelWithResult(
                text1: S.of(context).user_integral_speech,
                text2: '${criteria.integral.speech.toInt()}/10',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
