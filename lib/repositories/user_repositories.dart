import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserRepository({required this.firebaseAuth});

  // register
  Future<User?> register(String email, String password) async {
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

// log in
  Future<User?> logIn(String email, String password) async {
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

// log out
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

// check log in
  Future<bool> isLogIn() async {
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

  // get current user
  Future<User?> getCurrentUser() async {
    return await firebaseAuth.currentUser;
  }
}
