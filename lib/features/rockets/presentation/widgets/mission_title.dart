import 'package:flutter/material.dart';

class MissionTitle extends StatelessWidget {
  const MissionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 18),
      child: Text('Missions', style: theme.textTheme.titleLarge),
    );
  }
}
