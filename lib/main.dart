import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tbr_flutter_internship_test/app.dart';
import 'package:tbr_flutter_internship_test/core/services/di/di_service.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  DiService().initDi();
  runApp(const MainApp());
}
