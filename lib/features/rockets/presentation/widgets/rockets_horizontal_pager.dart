import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/rockets_data/rockets_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/screens/rockets_overview_screen/bloc/rockets_details_bloc.dart';

class RocketsHorizontalPager extends StatelessWidget {
  const RocketsHorizontalPager({
    super.key,
    required PageController pageController,
    required double currentPage,
    required this.rocketsList,
    required this.onPageChanged,
  }) : _pageController = pageController,
       _currentPage = currentPage;

  final List<RocketsData> rocketsList;
  final PageController _pageController;
  final double _currentPage;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194,
      child: PageView.builder(
        onPageChanged: (value) => context.read<RocketsDetailsBloc>().add(
          LoadLaunchesList(rocketId: rocketsList[value].id),
        ),
        controller: _pageController,
        itemCount: rocketsList.length,
        itemBuilder: (context, index) {
          final rocket = rocketsList[index];

          double diffToCenter = (index - _currentPage.round()).toDouble();
          double absDiff = diffToCenter.abs();

          double scale = (1 - (absDiff * 0.091)).clamp(0.8, 1.0);

          double difference = index - _currentPage;
          double direction = difference > 0 ? -1 : 1;

          double absDiffRound = (index - _currentPage.round()).toDouble().abs();
          double translationX = direction * absDiffRound * 3.8977;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: Matrix4.diagonal3Values(scale, scale, 1.0)
              ..setTranslationRaw(translationX, 0, 0),
            transformAlignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                color: const Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(rocket.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }
}
