import 'package:flutter/material.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/launch_card.dart';

class LaunchListView extends StatelessWidget {
  const LaunchListView({
    super.key,
    required this.launchesList,
    required this.onTap,
  });

  final List<LaunchesData> launchesList;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: launchesList.length,
      itemBuilder: (context, index) {
        final launch = launchesList[index];
        return LaunchCard(onTap: onTap, launch: launch);
      },
    );
  }
}
