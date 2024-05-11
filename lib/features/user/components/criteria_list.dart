import 'package:flutter/material.dart';

import '../models/criteria.dart';
import 'criteria_widget.dart';
import 'label_with_result.dart';

class CriteriaList extends StatelessWidget {
  const CriteriaList({
    super.key,
    required this.criteria,
  });

  final ICriteria criteria;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
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
                  text2: '${criteria.professional.knowledge.toInt()}/10'),
              LabelWithResult(
                  text1: 'Умения',
                  text2: '${criteria.professional.ability.toInt()}/10'),
              LabelWithResult(
                  text1: 'Навыки',
                  text2: '${criteria.professional.skills.toInt()}/10'),
              LabelWithResult(
                  text1: 'Проффесиональный опыт',
                  text2: '${criteria.professional.experience.toInt()}/10'),
              LabelWithResult(
                  text1: 'Квалификация',
                  text2: '${criteria.professional.qualification.toInt()}/10'),
              LabelWithResult(
                  text1: 'Результаты труда',
                  text2: '${criteria.professional.resultOfWork.toInt()}/10'),
            ],
          ),
        ),
        CriteriaWidget(
          headtext: 'Личностные качества',
          labels: Column(
            children: [
              LabelWithResult(
                text1: 'Способность к самооценке',
                text2: '${criteria.personal.theAbilityToSelfEsteem.toInt()}/10',
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
                text2: '${criteria.personal.psychologicalStability.toInt()}/10',
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
    );
  }
}
