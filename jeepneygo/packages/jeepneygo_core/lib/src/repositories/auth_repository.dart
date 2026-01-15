import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repository for authentication operations
class AuthRepository {
  final fb.FirebaseAuth _auth;

  AuthRepository({fb.FirebaseAuth? auth}) : _auth = auth ?? fb.FirebaseAuth.instance;

  /// Current user stream
  Stream<fb.User?> get authStateChanges => _auth.authStateChanges();

  /// Current user
  fb.User? get currentUser => _auth.currentUser;

  /// Send OTP to phone number
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(fb.PhoneAuthCredential) verificationCompleted,
    required void Function(fb.FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    Duration timeout = const Duration(seconds: 60),
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: timeout,
    );
  }

  /// Sign in with OTP credential
  Future<fb.UserCredential> signInWithCredential(
    fb.PhoneAuthCredential credential,
  ) async {
    return _auth.signInWithCredential(credential);
  }

  /// Create credential from verification ID and OTP code
  fb.PhoneAuthCredential createCredential({
    required String verificationId,
    required String smsCode,
  }) {
    return fb.PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

/// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

/// Provider for auth state changes
final authStateProvider = StreamProvider<fb.User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});
