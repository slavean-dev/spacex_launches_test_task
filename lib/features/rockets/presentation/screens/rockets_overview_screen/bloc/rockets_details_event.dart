part of 'rockets_details_bloc.dart';

class RocketsDetailsEvent extends Equatable {
  const RocketsDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadRocketsList extends RocketsDetailsEvent {}

class LoadLaunchesList extends RocketsDetailsEvent {
  const LoadLaunchesList({required this.rocketId});

  final String rocketId;

  @override
  List<Object> get props => [rocketId];
}
