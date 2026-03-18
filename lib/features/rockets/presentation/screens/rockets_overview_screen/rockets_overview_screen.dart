import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tbr_flutter_internship_test/core/services/link_launcher/link_launcher_service.dart';
import 'package:tbr_flutter_internship_test/core/widgets/base_progress_indicator.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/screens/rockets_overview_screen/bloc/rockets_details_bloc.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/mission_content_builder.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/mission_title.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/page_indicator.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/rockets_header.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/widgets/rockets_horizontal_pager.dart';

class RocketsOverviewScreen extends StatefulWidget {
  const RocketsOverviewScreen({super.key});

  @override
  State<RocketsOverviewScreen> createState() => _RocketsOverviewScreenState();
}

class _RocketsOverviewScreenState extends State<RocketsOverviewScreen> {
  double _currentPage = 0.0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.78);
    _pageController.addListener(() {
      _currentPage = _pageController.page!;
    });
    super.initState();
  }

  void _openWikipedia(BuildContext context, String urlString) async {
    final success = await LinkLauncherService.openUrl(urlString);

    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            urlString.isEmpty
                ? 'No Wikipedia link available'
                : 'Could not open: $urlString',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<RocketsDetailsBloc>()..add(LoadRocketsList()),
      child: Scaffold(
        body: BlocListener<RocketsDetailsBloc, RocketsDetailsState>(
          listener: (context, state) {
            if (state.rocketListStatus == RocketDetailsStatus.loaded &&
                state.launchesListStatus == RocketDetailsStatus.initial) {
              context.read<RocketsDetailsBloc>().add(
                LoadLaunchesList(rocketId: state.rocketsList[0].id),
              );
            }
          },
          child: BlocBuilder<RocketsDetailsBloc, RocketsDetailsState>(
            builder: (context, state) {
              switch (state.rocketListStatus) {
                case RocketDetailsStatus.loading:
                  return const BaseProgressIndicator();
                case RocketDetailsStatus.error:
                  return Center(child: Text('Error: ${state.error}}'));
                case RocketDetailsStatus.empty:
                  return const Center(child: Text('No rockets yet'));
                case RocketDetailsStatus.loaded:
                  final rocketsList = state.rocketsList;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RocketsHeader(),
                      RocketsHorizontalPager(
                        onPageChanged: (value) =>
                            context.read<RocketsDetailsBloc>().add(
                              LoadLaunchesList(rocketId: rocketsList[value].id),
                            ),
                        pageController: _pageController,
                        currentPage: _currentPage,
                        rocketsList: rocketsList,
                      ),
                      PageIndicator(
                        rocketsList: rocketsList,
                        currentPage: _currentPage,
                      ),
                      const MissionTitle(),
                      Expanded(
                        child: MissionContentBuilder(
                          onTap: (url) => _openWikipedia(context, url),
                          state: state,
                        ),
                      ),
                    ],
                  );
                default:
                  {
                    return const SizedBox();
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
