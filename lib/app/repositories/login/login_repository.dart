import 'package:firebase_auth/firebase_auth.dart';

abstract interface class LoginRepository {
  Future<UserCredential> login();

  Future<void> logout();
}
