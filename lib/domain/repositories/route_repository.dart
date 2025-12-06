import 'package:onway/domain/entities/route_entity.dart';
import 'package:result_dart/result_dart.dart';

/// Repository interface for route operations
abstract class RouteRepository {
  /// Fetches all available routes
  AsyncResult<List<RouteEntity>> getRoutes();
}
