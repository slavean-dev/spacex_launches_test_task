import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String? _baseUrl;

  void initEnv() {
    _baseUrl = dotenv.env['BASE_URL'];
  }

  String get baseUrl => _baseUrl ?? '';
}
