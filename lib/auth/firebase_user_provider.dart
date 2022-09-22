import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MomoCoinFirebaseUser {
  MomoCoinFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MomoCoinFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MomoCoinFirebaseUser> momoCoinFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MomoCoinFirebaseUser>(
            (user) => currentUser = MomoCoinFirebaseUser(user));
