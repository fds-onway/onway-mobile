/// Domain entity representing a travel route
class RouteEntity {
  final int id;
  final String name;
  final String description;
  final List<String> tags;
  final String image;

  const RouteEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RouteEntity &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.tags == tags &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        tags.hashCode ^
        image.hashCode;
  }
}
