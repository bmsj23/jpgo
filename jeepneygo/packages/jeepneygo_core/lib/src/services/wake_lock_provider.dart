import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'wake_lock_service.dart';

// provider for wake lock service singleton
final wakeLockServiceProvider = Provider<WakeLockService>((ref) {
  final service = WakeLockService();
  ref.onDispose(() => service.dispose());
  return service;
});

// provider for wake lock active state stream
final wakeLockStateProvider = StreamProvider<bool>((ref) {
  final service = ref.watch(wakeLockServiceProvider);
  return service.wakeLockState;
});

// provider for checking if wake lock is currently active
final isWakeLockActiveProvider = Provider<bool>((ref) {
  final service = ref.watch(wakeLockServiceProvider);
  return service.isWakeLockActive;
});

// provider for checking if wake lock is supported on this platform
final isWakeLockSupportedProvider = Provider<bool>((ref) {
  final service = ref.watch(wakeLockServiceProvider);
  return service.isSupported;
});
