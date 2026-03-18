import 'package:intl/intl.dart';

class LaunchesData {
  LaunchesData({
    required this.name,
    required this.date,
    required this.wikiUrl,
    required this.time,
    required this.launchpad,
    required this.success,
  });

  final String name;
  final String date;
  final String wikiUrl;
  final String time;
  final String launchpad;
  final bool success;

  factory LaunchesData.fromJson(Map<String, dynamic> json) {
    final rawDate = DateTime.parse(json['date_utc'] as String).toLocal();

    return LaunchesData(
      name: json['name'] ?? 'No name',
      date: DateFormat('dd/MM/yyyy').format(rawDate),
      wikiUrl: json['links']['wikipedia'] ?? '',
      time: DateFormat('hh:mm a').format(rawDate),
      launchpad: _launchpadName(json),
      success: json['success'] ?? false,
    );
  }

  static String _launchpadName(Map<String, dynamic> json) {
    final launchpad = json['launchpad'];

    if (launchpad is Map<String, dynamic>) {
      return launchpad['full_name'] ?? 'Unknown Pad';
    }

    return 'Unknown Pad';
  }
}
