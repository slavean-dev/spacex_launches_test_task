class RocketsData {
  RocketsData({required this.name, required this.id, required this.imageUrl});
  final String name;
  final String id;
  final String imageUrl;

  factory RocketsData.fromJson(Map<String, dynamic> json) {
    return RocketsData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['flickr_images'][0] ?? '',
    );
  }
}
