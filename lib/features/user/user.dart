import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/features/user/models/iuser.dart';
import 'package:pas_service/generated/l10n.dart';
import 'package:pas_service/router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'components/criteria_list.dart';
import 'components/user_field.dart';
import 'models/criteria.dart';

import 'package:intl/intl.dart';

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

  List<LineData> chartProfessional = [];
  List<LineData> chartPersonal = [];
  List<LineData> chartBusiness = [];
  List<LineData> chartIntegral = [];

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

    final backups = await db
        .collection('backups')
        .where('email', isEqualTo: widget.id)
        .orderBy('date', descending: false)
        .get();

    for (var element in backups.docs) {
      var data = element.data();

      var date = element['date'].toDate();
      var dateStr = DateFormat('dd-MM-yyyy').format(date);
      ICriteria criteriaBackup = ICriteria().fromFirestore(data);

      chartProfessional.add(LineData(
        dateStr,
        criteriaBackup.professional.getAVG(),
      ));

      chartPersonal.add(LineData(
        dateStr,
        criteriaBackup.personal.getAVG(),
      ));

      chartBusiness.add(LineData(
        dateStr,
        criteriaBackup.business.getAVG(),
      ));

      chartIntegral.add(LineData(
        dateStr,
        criteriaBackup.integral.getAVG(),
      ));
    }

    isLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).user),
        actions: [
          IconButton(
            onPressed: () async {
              var db = FirebaseFirestore.instance;
              user!.state = true;
              await db
                  .collection('users')
                  .doc(widget.id)
                  .set(user!.toFirestore());
              setState(() {
                getValuesFromId();
              });
            },
            icon: const Icon(Icons.replay_circle_filled_rounded),
          )
        ],
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
                      child: Text(S.of(context).user_start),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).user_cantStart,
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
                ExpandablePageView(
                  children: [
                    CriteriaList(criteria: criteria, user: user!),
                    Column(
                      children: [
                        Chart(
                            data: chartProfessional,
                            label: S.of(context).user_professional),
                        Chart(
                            data: chartPersonal,
                            label: S.of(context).user_personal),
                        Chart(
                            data: chartBusiness,
                            label: S.of(context).user_business),
                        Chart(
                            data: chartIntegral,
                            label: S.of(context).user_integral),
                      ],
                    )
                  ],
                ),
              ],
            ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.data,
    required this.label,
  });

  final List<LineData> data;
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge,
        ),
        SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          series: <LineSeries<LineData, String>>[
            LineSeries<LineData, String>(
              dataSource: data,
              xValueMapper: (LineData line, _) => line.date,
              yValueMapper: (LineData line, _) => line.value,
            )
          ],
        ),
      ],
    );
  }
}

class LineData {
  final String date;
  final double value;
  LineData(this.date, this.value);
}
