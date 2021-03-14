import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Auth(
    this._firebaseAuth,
  );

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed up';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 'Logged out';
    } catch (e) {
      return e.toString();
    }
  }
}
