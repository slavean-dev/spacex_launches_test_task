import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tbr_flutter_internship_test/core/services/env/env_service.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/services/space_api_service.dart';
import 'package:tbr_flutter_internship_test/features/rockets/presentation/screens/rockets_overview_screen/bloc/rockets_details_bloc.dart';

import '../../../features/rockets/data/repositories/abstract_rockets_repository.dart';
import '../../../features/rockets/data/repositories/rockets_repository.dart';

class DiService {
  void initDi() {
    final getIt = GetIt.I;

    getIt.registerSingleton<EnvService>(EnvService()..initEnv());

    getIt.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: GetIt.I<EnvService>().baseUrl)),
    );

    getIt.registerSingleton<AbstractSpaceApi>(
      SpaceApiService(dio: getIt<Dio>()),
    );

    getIt.registerSingleton<AbstractRocketsRepository>(
      RocketsRepository(spaceApiService: getIt<AbstractSpaceApi>()),
    );

    getIt.registerFactory<RocketsDetailsBloc>(
      () => RocketsDetailsBloc(getIt<AbstractRocketsRepository>()),
    );
  }
}
