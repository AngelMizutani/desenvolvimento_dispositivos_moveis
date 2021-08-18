//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthentication {
  static Future<User> registerUsingEmailPassword(
      {String email, String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        print('Essa conta já existe');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User> signInUsingEmailPassword(
      {String email, String password, BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Nenhum usuário encontrado');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta');
      }
    }

    return user;
  }

  static Future<User> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
