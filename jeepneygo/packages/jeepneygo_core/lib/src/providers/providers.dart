/// Barrel file for all providers
library;

// Re-export repository providers
export '../repositories/auth_repository.dart' show authRepositoryProvider, authStateProvider;
export '../repositories/user_repository.dart' show userRepositoryProvider;
export '../repositories/route_repository.dart' show routeRepositoryProvider;
export '../repositories/trip_repository.dart' show tripRepositoryProvider;

// Re-export service providers
export '../services/location_service.dart' 
    show locationServiceProvider, currentPositionProvider, positionStreamProvider;

// Re-export wake lock providers
export '../services/wake_lock_provider.dart' 
    show wakeLockServiceProvider, wakeLockStateProvider, isWakeLockActiveProvider, isWakeLockSupportedProvider;
