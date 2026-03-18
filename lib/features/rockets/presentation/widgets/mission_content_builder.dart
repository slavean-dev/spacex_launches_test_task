import 'package:flutter/material.dart';
import 'package:tbr_flutter_internship_test/core/widgets/base_progress_indicator.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/screens/rockets_overview_screen/bloc/rockets_details_bloc.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/launches_list_view.dart';

class MissionContentBuilder extends StatelessWidget {
  const MissionContentBuilder({
    super.key,
    required this.state,
    required this.onTap,
  });

  final RocketsDetailsState state;

  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    switch (state.launchesListStatus) {
      case RocketDetailsStatus.loading:
        return const BaseProgressIndicator();
      case RocketDetailsStatus.error:
        return Center(child: Text('Error: ${state.error}'));
      case RocketDetailsStatus.empty:
        return const Center(child: Text('No missions yet'));
      case RocketDetailsStatus.loaded:
        return LaunchListView(
          onTap: onTap,
          launchesList: state.launchesList ?? [],
        );
      default:
        return const SizedBox();
    }
  }
}
