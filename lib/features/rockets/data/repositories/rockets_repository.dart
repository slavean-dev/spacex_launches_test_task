import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/launches_data/launches_request_body.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/models/rockets_data/rockets_data.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/repositories/abstract_rockets_repository.dart';
import 'package:tbr_flutter_internship_test/features/rockets/data/services/space_api_service.dart';

class RocketsRepository implements AbstractRocketsRepository {
  RocketsRepository({required this.spaceApiService});
  final AbstractSpaceApi spaceApiService;

  @override
  Future<List<RocketsData>> fetchRockets() async {
    final response = await spaceApiService.fetchRockets();
    if (response.statusCode != 200) {
      throw Exception(response.data['error'] ?? 'Failed to fetch rockets');
    }
    final data = response.data as List;
    return data.map((e) => RocketsData.fromJson(e)).toList();
  }

  @override
  Future<List<LaunchesData>> fetchLaunches(String rocketId) async {
    try {
      final queryBody = LaunchesRequestBody(rocketId: rocketId);
      final response = await spaceApiService.fetchLaunches(queryBody.toJson());
      if (response.statusCode != 200) {
        throw Exception(response.data['error'] ?? 'Failed to fetch rockets');
      }
      final data = response.data['docs'] as List;
      return data.map((e) => LaunchesData.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
