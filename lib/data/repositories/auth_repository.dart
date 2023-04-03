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
