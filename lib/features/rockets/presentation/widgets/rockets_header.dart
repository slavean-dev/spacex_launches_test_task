import 'package:flutter/material.dart';

class RocketsHeader extends StatelessWidget {
  const RocketsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          child: Text('SpaceX Launches', style: theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
