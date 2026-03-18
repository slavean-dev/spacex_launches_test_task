import 'package:flutter/material.dart';
import 'package:tbr_flutter_internship_test/core/theme/app_colors.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/rockets_data/rockets_data.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required double currentPage,
    required this.rocketsList,
  }) : _currentPage = currentPage;

  final double _currentPage;
  final List<RocketsData> rocketsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(rocketsList.length, (index) {
          final isActive = _currentPage.round() == index;
          return Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, top: 12),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border, width: 1),
              ),
            ),
          );
        }),
      ),
    );
  }
}
