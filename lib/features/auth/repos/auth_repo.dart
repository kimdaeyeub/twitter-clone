import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  Stream<User?> authState() => _firebaseAuth.authStateChanges();

  Future<void> createAccount(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider(
  (ref) => AuthRepository(),
);

final userState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authState();
});
