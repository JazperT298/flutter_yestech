import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(
    BuildContext context,String email, String password) async {
    try{
        //showAlertDialog(context);
        AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null){
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'email': email,
          'profileImageUrl': '',
        });
        Provider.of<UserData>(context).currentUserId = signedInUser.uid;
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()
        ));
        // Navigator.pushReplacementNamed(context, FeedScreen.id);
      }
    }catch(e){
      print(e);
    }

  }

  static void logout(){
    _auth.signOut();
    //Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static void login( BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
      ));
    }catch(e){
      print(e);
    }
  }

  static void showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
          children: [
             CircularProgressIndicator(),
             Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
          ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}