import 'package:firebase_auth/firebase_auth.dart';

import '../../core/error/app_errors.dart';

class AuthDataSource {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    try {
      final credential = await _authInstance.createUserWithEmailAndPassword(
        email: email, password: password,);
      return credential.user?.uid ?? "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthError("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw AuthError('The account already exists for that email.');
      }
      throw AuthError(e.message ?? "User create failed");
    } catch (e) {
      throw AuthError(e.toString());
    }
  }

  Future<String> login(String email, String password) async {
    try {
      final credential = await _authInstance.signInWithEmailAndPassword(
        email: email, password: password,);

      return credential.user?.uid ?? "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw AuthError('Wrong password provided for that user.');
      }
      throw AuthError(e.message ?? "Login Failed");
    } catch (e) {
      throw AuthError(e.toString());
    }
  }
}