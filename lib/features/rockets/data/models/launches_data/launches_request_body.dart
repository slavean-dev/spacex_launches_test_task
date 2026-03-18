class LaunchesRequestBody {
  const LaunchesRequestBody({required this.rocketId});

  final String rocketId;

  Map<String, dynamic> toJson() {
    return {
      'query': {'rocket': rocketId},
      'options': {
        'pagination': false,
        'populate': [
          {
            'path': 'launchpad',
            'select': {'name': 1, 'full_name': 1},
          },
        ],
      },
    };
  }
}
