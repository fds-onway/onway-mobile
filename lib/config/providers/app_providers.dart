import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../ui/features/auth/viewmodels/auth_view_model.dart';

/// Provider setup for dependency injection
class AppProviders {
  /// Get all providers combined
  static List<SingleChildWidget> get allProviders => [
    // Repository provider
    Provider<AuthRepository>(
      create: (_) => AuthRepositoryImpl(firebaseAuth: FirebaseAuth.instance),
    ),
    // ViewModel provider
    ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(
        context.read<AuthRepository>(),
      ),
    ),
  ];
}
