import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

/// Repository for user operations
class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  /// Get user by ID
  Future<User?> getUser(String uid) async {
    final doc = await _usersCollection.doc(uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return User.fromJson({...doc.data()!, 'uid': doc.id});
  }

  /// Get user stream
  Stream<User?> userStream(String uid) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return User.fromJson({...doc.data()!, 'uid': doc.id});
    });
  }

  /// Create or update user
  Future<void> setUser(User user) async {
    await _usersCollection.doc(user.uid).set(
          user.toJson()..remove('uid'),
          SetOptions(merge: true),
        );
  }

  /// Update user fields
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _usersCollection.doc(uid).update(data);
  }

  /// Get all pending drivers (for admin)
  Stream<List<User>> pendingDriversStream() {
    return _usersCollection
        .where('role', isEqualTo: 'driver')
        .where('driverStatus', isEqualTo: 'pending')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => User.fromJson({...doc.data(), 'uid': doc.id}))
            .toList());
  }

  /// Approve driver
  Future<void> approveDriver(String driverId, String adminId) async {
    await _usersCollection.doc(driverId).update({
      'driverStatus': 'approved',
      'approvedAt': FieldValue.serverTimestamp(),
      'approvedBy': adminId,
    });
  }

  /// Reject driver
  Future<void> rejectDriver(String driverId, String reason) async {
    await _usersCollection.doc(driverId).update({
      'driverStatus': 'rejected',
      'rejectionReason': reason,
    });
  }
}

/// Provider for UserRepository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});
