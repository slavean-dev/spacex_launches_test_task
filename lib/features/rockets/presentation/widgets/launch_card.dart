import 'package:flutter/material.dart';
import 'package:tbr_flutter_internship_test/core/theme/app_colors.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_data.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({super.key, required this.launch, required this.onTap});

  final LaunchesData launch;

  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: GestureDetector(
        onTap: () => onTap(launch.wikiUrl),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                offset: const Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(launch.date, style: theme.textTheme.labelLarge),
                    Text(launch.time, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 21,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.name,
                        softWrap: true,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        softWrap: true,
                        launch.launchpad,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
