import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/route_repository_impl.dart';
import '../../data/services/onway_api/api_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/route_repository.dart';
import '../../ui/features/auth/viewmodels/auth_view_model.dart';
import '../../ui/features/home/viewmodels/home_view_model.dart';

/// Provider setup for dependency injection
class AppProviders {
  /// Get all providers combined
  static List<SingleChildWidget> get allProviders => [
    // Services
    Provider<ApiService>(
      create: (_) => ApiService(),
    ),

    // Repository providers
    Provider<AuthRepository>(
      create: (_) => AuthRepositoryImpl(firebaseAuth: FirebaseAuth.instance),
    ),
    Provider<RouteRepository>(
      create: (context) => RouteRepositoryImpl(context.read<ApiService>()),
    ),

    // ViewModel providers
    ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(
        context.read<AuthRepository>(),
      ),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        context.read<RouteRepository>(),
      ),
    ),
  ];
}
