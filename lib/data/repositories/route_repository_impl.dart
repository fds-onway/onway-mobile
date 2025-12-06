import 'dart:convert';

import 'package:onway/data/models/route_dto.dart';
import 'package:onway/data/services/onway_api/api_service.dart';
import 'package:onway/domain/entities/route_entity.dart';
import 'package:onway/domain/repositories/route_repository.dart';
import 'package:result_dart/result_dart.dart';

/// Implementation of RouteRepository using ApiService
class RouteRepositoryImpl implements RouteRepository {
  final ApiService _apiService;

  RouteRepositoryImpl(this._apiService);

  @override
  AsyncResult<List<RouteEntity>> getRoutes() async {
    try {
      final result = await _apiService.get(path: '/route');

      return result.fold(
        (response) {
          if (response.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(response.body);
            final routes = jsonList
                .map((json) => RouteDto.fromJson(json).toEntity())
                .toList();
            return Success(routes);
          } else {
            return Failure(
              RouteException('Failed to load routes: ${response.statusCode}'),
            );
          }
        },
        (error) => Failure(
          RouteException('Error fetching routes: ${error.toString()}'),
        ),
      );
    } catch (e) {
      return Failure(
        RouteException('Unexpected error: ${e.toString()}'),
      );
    }
  }
}

class RouteException implements Exception {
  final String message;
  RouteException(this.message);

  @override
  String toString() => message;
}
