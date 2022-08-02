import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginform/screens/homescreen.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future googleLogin( var context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

     var check = await FirebaseAuth.instance.signInWithCredential(credential);
     if(!check.user!.isAnonymous){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
     }
    } catch (e){
      print((e).toString());
    }
    notifyListeners();
  }
    Future logout()async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}