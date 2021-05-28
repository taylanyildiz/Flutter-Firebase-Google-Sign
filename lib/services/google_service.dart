import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignService with ChangeNotifier {
  GoogleSignInAccount? _account;
  GoogleSignInAccount get user => _account!;
  Future<void> googleSign() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      _account = googleUser;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> googleLogOut() async {
    try {
      await GoogleSignIn().disconnect();
      FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
