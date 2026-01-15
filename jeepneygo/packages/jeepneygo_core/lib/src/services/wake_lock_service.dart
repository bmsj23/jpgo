import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

// wake lock sentinel type for web api
@JS('WakeLockSentinel')
extension type WakeLockSentinel._(JSObject _) implements JSObject {
  external JSPromise<JSAny?> release();
  external bool get released;
  external String get type;
}

// wake lock type for web api
@JS()
extension type WakeLock._(JSObject _) implements JSObject {
  external JSPromise<WakeLockSentinel> request(String type);
}

// extension to access wake lock from navigator
extension NavigatorWakeLock on web.Navigator {
  @JS('wakeLock')
  external WakeLock get wakeLock;
}

class WakeLockService {
  WakeLockSentinel? _wakeLockSentinel;
  bool _isSupported = false;
  final _wakeLockStateController = StreamController<bool>.broadcast();

  Stream<bool> get wakeLockState => _wakeLockStateController.stream;
  bool get isWakeLockActive => _wakeLockSentinel != null;
  bool get isSupported => _isSupported;

  WakeLockService() {
    _checkSupport();
  }

  void _checkSupport() {
    if (kIsWeb) {
      try {
        // check if wake lock api is available in browser
        _isSupported = true;
      } catch (e) {
        _isSupported = false;
        debugPrint('Wake Lock API not supported: $e');
      }
    } else {
      _isSupported = false;
    }
  }

  // request a wake lock to keep the screen on
  Future<bool> requestWakeLock() async {
    if (!kIsWeb || !_isSupported) {
      debugPrint('Wake Lock not supported on this platform');
      return false;
    }

    try {
      final navigator = web.window.navigator;
      final wakeLock = navigator.wakeLock;

      final sentinel = await wakeLock.request('screen').toDart;
      _wakeLockSentinel = sentinel as WakeLockSentinel?;
      _wakeLockStateController.add(true);
      
      debugPrint('Wake Lock acquired successfully');
      return true;
    } catch (e) {
      debugPrint('Failed to acquire Wake Lock: $e');
      _wakeLockStateController.add(false);
      return false;
    }
  }

  // release the wake lock to allow the screen to turn off
  Future<void> releaseWakeLock() async {
    if (_wakeLockSentinel == null) {
      return;
    }

    try {
      await _wakeLockSentinel!.release().toDart;
      _wakeLockSentinel = null;
      _wakeLockStateController.add(false);
      debugPrint('Wake Lock released');
    } catch (e) {
      debugPrint('Failed to release Wake Lock: $e');
    }
  }

  // toggle wake lock state
  Future<bool> toggleWakeLock() async {
    if (isWakeLockActive) {
      await releaseWakeLock();
      return false;
    } else {
      return await requestWakeLock();
    }
  }

  void dispose() {
    releaseWakeLock();
    _wakeLockStateController.close();
  }
}
