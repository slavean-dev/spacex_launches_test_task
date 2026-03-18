import 'package:dio/dio.dart';
import 'package:tbr_flutter_internship_test/core/constants/api_constants.dart';

abstract class AbstractSpaceApi {
  Future<Response<dynamic>> fetchRockets();
  Future<Response<dynamic>> fetchLaunches(Map<String, dynamic> data);
}

class SpaceApiService implements AbstractSpaceApi {
  const SpaceApiService({required this.dio});
  final Dio dio;

  @override
  Future<Response<dynamic>> fetchRockets() {
    return dio.get(ApiUrlConstants.rocketsListUrl);
  }

  @override
  Future<Response<dynamic>> fetchLaunches(Map<String, dynamic> data) {
    return dio.post(ApiUrlConstants.launchesListUrl, data: data);
  }
}
