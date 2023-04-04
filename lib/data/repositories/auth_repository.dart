import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<void> register(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserInfo() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          String userID = user.uid;
          String userEmail = user.email!;
          FirebaseFirestore.instance
              .collection('users')
              .doc(userID)
              .collection('user_profile')
              .doc('user_profile')
              .set(
            {
              'name': '',
              'email': userEmail,
              'last_update': DateTime.now(),
              'first_login': true,
              'avatar_url': '',
            },
          );
        }
      },
    );
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> updatePassword(
    String password,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      return;
    } else {
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
    }
  }

  Future<void> resetPassword(
    String email,
  ) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
