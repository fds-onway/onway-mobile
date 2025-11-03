# GitHub Copilot Instructions - OnWay Flutter MVVM Architecture

## Project Overview
This is a Flutter mobile application implementing MVVM (Model-View-ViewModel) architecture following Flutter's official architecture guide. The app uses Firebase for authentication and backend services, with local data management using Drift.

## Architecture Patterns

### MVVM Structure
Follow the MVVM pattern with clear separation of concerns:

```
lib/
├── data/           # Data layer (Models & Data Sources)
├── domain/         # Business logic layer (Entities & Repositories)
├── ui/             # Presentation layer (Views & ViewModels)
│   ├── core/       # Shared UI components and utilities
│   └── features/   # Feature-specific UI implementations
└── config/         # Configuration and setup
```

### Layer Responsibilities

#### Data Layer (`lib/data/`)
- **Models**: Data transfer objects and entity mappings
- **Local**: Local data sources (Drift database, SharedPreferences)
- **Remote**: Remote data sources (Firebase, HTTP APIs)
- **Services**: Platform-specific services and integrations

**Guidelines:**
- Use `Result<T>` from `result_dart` package for error handling
- Implement repository interfaces defined in domain layer
- Keep data models separate from domain entities
- Use Drift for local database operations
- Implement caching strategies where appropriate

#### Domain Layer (`lib/domain/`)
- **Entities**: Pure business objects without dependencies
- **Repositories**: Abstract interfaces for data access
- **Use Cases**: Business logic and rules
- **Auth**: Authentication-related business logic

**Guidelines:**
- No dependencies on Flutter framework or external packages
- Define repository interfaces that data layer implements
- Keep entities immutable using `const` constructors
- Use value objects for complex data types
- Implement business validation rules here

#### UI Layer (`lib/ui/`)
- **Views**: Stateless/Stateful widgets (Pages, Screens)
- **ViewModels**: State management and UI logic using ChangeNotifier or StateNotifier
- **Widgets**: Reusable UI components
- **Core**: Shared themes, constants, and utilities

**Guidelines:**
- Views should be as dumb as possible, delegating logic to ViewModels
- Use `ChangeNotifier` or `StateNotifier` for ViewModels
- Implement proper loading, error, and success states
- Follow Material Design 3 guidelines
- Use `Consumer` or `Selector` widgets for efficient rebuilds

### Code Generation & Best Practices

#### State Management
```dart
// ViewModel Example
class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  
  AuthState _state = AuthState.initial();
  AuthState get state => _state;
  
  AuthViewModel(this._authRepository);
  
  Future<void> signIn(String email, String password) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    
    final result = await _authRepository.signIn(email, password);
    
    result.fold(
      (error) => _state = _state.copyWith(
        isLoading: false, 
        error: error.message
      ),
      (user) => _state = _state.copyWith(
        isLoading: false, 
        user: user
      ),
    );
    notifyListeners();
  }
}
```

#### Repository Implementation
```dart
// Repository Interface (Domain)
abstract class AuthRepository {
  Future<Result<User>> signIn(String email, String password);
  Future<Result<User>> getCurrentUser();
  Future<Result<void>> signOut();
}

// Repository Implementation (Data)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _firebaseAuth;
  final LocalUserDataSource _localDataSource;
  
  AuthRepositoryImpl(this._firebaseAuth, this._localDataSource);
  
  @override
  Future<Result<User>> signIn(String email, String password) async {
    try {
      final firebaseUser = await _firebaseAuth.signIn(email, password);
      final user = firebaseUser.toDomainEntity();
      await _localDataSource.saveUser(user);
      return Result.success(user);
    } catch (e) {
      return Result.failure(AuthException(e.toString()));
    }
  }
}
```

#### Error Handling
- Always use `Result<T>` for operations that can fail
- Create custom exception classes for different error types
- Implement proper error messages and user feedback
- Log errors appropriately for debugging

#### File Naming Conventions
- **Views**: `*_page.dart`, `*_screen.dart`
- **ViewModels**: `*_view_model.dart`, `*_notifier.dart`
- **Models**: `*_model.dart`, `*_dto.dart`
- **Entities**: `*_entity.dart` or just the entity name
- **Repositories**: `*_repository.dart`
- **Services**: `*_service.dart`

#### Dependency Injection
- Use constructor injection
- Create service locator or use packages like `get_it`
- Inject dependencies at the highest possible level
- Mock dependencies in tests

### Firebase Integration
- Configure Firebase properly in `config/firebase/`
- Use Firebase Auth for authentication
- Implement proper error handling for Firebase operations
- Handle network connectivity issues
- Implement offline capabilities where needed

### Testing Strategy
- Unit tests for ViewModels and business logic
- Widget tests for UI components
- Integration tests for complete user flows
- Mock external dependencies using `mockito`
- Test error scenarios and edge cases

### Performance Considerations
- Use `const` constructors where possible
- Implement proper widget keys for list items
- Use `Selector` instead of `Consumer` for specific rebuilds
- Optimize image loading and caching
- Implement pagination for large data sets

### Code Style
- Follow official Dart style guide
- Use `flutter_lints` for consistent code quality
- Implement proper documentation with dartdoc comments
- Use meaningful variable and method names
- Keep methods small and focused on single responsibility

### Security Best Practices
- Never commit sensitive data (API keys, passwords)
- Use environment variables for configuration
- Implement proper input validation
- Handle user permissions correctly
- Follow OAuth 2.0 best practices for authentication

## Common Patterns to Implement

1. **Loading States**: Always show loading indicators during async operations
2. **Error Handling**: Implement consistent error UI across the app
3. **Navigation**: Use named routes with proper parameter passing
4. **Form Validation**: Implement client-side validation with proper error messages
5. **Offline Support**: Cache data locally and sync when online
6. **Responsive Design**: Ensure UI works on different screen sizes

When implementing new features, always consider:
- Which layer the code belongs to
- How to maintain separation of concerns
- Error handling and edge cases
- Testing strategy
- Performance implications
- User experience considerations