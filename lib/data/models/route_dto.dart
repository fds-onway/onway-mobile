import 'package:onway/domain/entities/route_entity.dart';

/// Data Transfer Object for Route
class RouteDto {
  final int id;
  final String name;
  final String description;
  final List<String> tags;
  final String image;

  const RouteDto({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.image,
  });

  /// Creates a RouteDto from JSON
  factory RouteDto.fromJson(Map<String, dynamic> json) {
    return RouteDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
    );
  }

  /// Converts this DTO to a domain entity
  RouteEntity toEntity() {
    return RouteEntity(
      id: id,
      name: name,
      description: description,
      tags: tags,
      image: image,
    );
  }

  /// Converts this DTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tags': tags,
      'image': image,
    };
  }
}
