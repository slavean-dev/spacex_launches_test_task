part of 'rockets_details_bloc.dart';

enum RocketDetailsStatus { initial, loading, empty, loaded, error }

class RocketsDetailsState extends Equatable {
  const RocketsDetailsState({
    required this.rocketListStatus,
    required this.launchesListStatus,
    required this.rocketsList,
    this.launchesList,
    this.error,
  });

  final RocketDetailsStatus rocketListStatus;
  final RocketDetailsStatus launchesListStatus;
  final List<RocketsData> rocketsList;
  final List<LaunchesData>? launchesList;
  final String? error;

  factory RocketsDetailsState.initial() {
    return const RocketsDetailsState(
      rocketListStatus: RocketDetailsStatus.initial,
      launchesListStatus: RocketDetailsStatus.initial,
      rocketsList: [],
      launchesList: null,
      error: null,
    );
  }

  @override
  List<Object?> get props => [
    rocketListStatus,
    launchesListStatus,
    rocketsList,
    launchesList,
    error,
  ];

  RocketsDetailsState copyWith({
    RocketDetailsStatus? rocketListStatus,
    RocketDetailsStatus? launchesListStatus,
    List<RocketsData>? rocketsList,
    List<LaunchesData>? launchesList,
    String? error,
  }) {
    return RocketsDetailsState(
      rocketListStatus: rocketListStatus ?? this.rocketListStatus,
      launchesListStatus: launchesListStatus ?? this.launchesListStatus,
      rocketsList: rocketsList ?? this.rocketsList,
      launchesList: launchesList ?? this.launchesList,
      error: error ?? error,
    );
  }
}
