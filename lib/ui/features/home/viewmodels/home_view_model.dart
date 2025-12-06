import 'package:flutter/foundation.dart';
import 'package:onway/domain/entities/route_entity.dart';
import 'package:onway/domain/repositories/route_repository.dart';

/// State for Home screen
class HomeState {
  final bool isLoading;
  final List<RouteEntity> routes;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.routes = const [],
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    List<RouteEntity>? routes,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      routes: routes ?? this.routes,
      error: error,
    );
  }
}

/// ViewModel for Home screen
class HomeViewModel extends ChangeNotifier {
  final RouteRepository _routeRepository;

  HomeState _state = const HomeState();
  HomeState get state => _state;

  HomeViewModel(this._routeRepository);

  /// Fetches all routes from the repository
  Future<void> fetchRoutes() async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();

    final result = await _routeRepository.getRoutes();

    result.fold(
      (routes) {
        _state = _state.copyWith(
          isLoading: false,
          routes: routes,
          error: null,
        );
      },
      (error) {
        _state = _state.copyWith(
          isLoading: false,
          error: error.toString(),
        );
      },
    );
    notifyListeners();
  }

  /// Retries fetching routes (useful for error recovery)
  Future<void> retry() async {
    await fetchRoutes();
  }
}
