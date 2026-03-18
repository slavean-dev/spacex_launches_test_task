import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/rockets_data/rockets_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/repositories/abstract_rockets_repository.dart';

part 'rockets_details_event.dart';
part 'rockets_details_state.dart';

class RocketsDetailsBloc
    extends Bloc<RocketsDetailsEvent, RocketsDetailsState> {
  final AbstractRocketsRepository _rocketsRepository;

  RocketsDetailsBloc(this._rocketsRepository)
    : super(RocketsDetailsState.initial()) {
    on<LoadRocketsList>(_loadRocketsList);
    on<LoadLaunchesList>(_loadLaunchesList, transformer: restartable());
  }

  Future<void> _loadRocketsList(
    LoadRocketsList event,
    Emitter<RocketsDetailsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          rocketListStatus: RocketDetailsStatus.loading,
          rocketsList: [],
          error: null,
        ),
      );
      final rocketsList = await _rocketsRepository.fetchRockets();
      if (rocketsList.isEmpty) {
        emit(state.copyWith(rocketListStatus: RocketDetailsStatus.empty));
        return;
      }
      emit(
        state.copyWith(
          rocketListStatus: RocketDetailsStatus.loaded,
          rocketsList: rocketsList,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          rocketListStatus: RocketDetailsStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _loadLaunchesList(
    LoadLaunchesList event,
    Emitter<RocketsDetailsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          launchesListStatus: RocketDetailsStatus.loading,
          launchesList: null,
          error: null,
        ),
      );
      final launchesList = await _rocketsRepository.fetchLaunches(
        event.rocketId,
      );
      if (launchesList.isEmpty) {
        emit(state.copyWith(launchesListStatus: RocketDetailsStatus.empty));
      } else {
        emit(
          state.copyWith(
            launchesListStatus: RocketDetailsStatus.loaded,
            launchesList: launchesList,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          launchesListStatus: RocketDetailsStatus.error,
          error: e.toString(),
        ),
      );
    }
  }
}
