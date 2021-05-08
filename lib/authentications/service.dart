

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signing_up(String email,String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return false;
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
        return false;
      }
}

Future<bool> logging_in(String email,String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
        );
        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return false;
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return false;
        }
      }
}

Future<void> logging_out() async {
      await FirebaseAuth.instance.signOut();
}