import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sw_planner/domain/models/user_model.dart';

class UserRepository {
  // Future<UserModel> get({required String id}) async {
  //   final userId = FirebaseAuth.instance.currentUser?.uid;
  //   //final userEmail = FirebaseAuth.instance.currentUser?.email;
  //   if (userId == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   final doc = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .collection('user_profile')
  //       .doc('user_profile')
  //       .get();
  //   return UserModel(
  //     userEmail: doc['email'],
  //     userName: doc['name'],
  //     userAvatarUrl: doc['avatar_url'],
  //     lastProfileUpdate: doc['last_update'],
  //     isFirstLogin: doc['first_login'],
  //   );
  // }

  Stream<UserModel> userProfileStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('user_profile')
        .doc('user_profile')
        .snapshots()
        .map((snapshot) {
      final doc = snapshot;
      return UserModel(
        userEmail: doc['email'],
        userName: doc['name'],
        userAvatarUrl: doc['avatar_url'],
        lastProfileUpdate: (doc['last_update'] as Timestamp).toDate(),
        isFirstLogin: doc['first_login'],
      );
    });
  }
}
