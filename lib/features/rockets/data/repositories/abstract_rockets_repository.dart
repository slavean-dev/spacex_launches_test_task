import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/rockets_data/rockets_data.dart';

abstract class AbstractRocketsRepository {
  Future<List<RocketsData>> fetchRockets();
  Future<List<LaunchesData>> fetchLaunches(String rocketId);
}
