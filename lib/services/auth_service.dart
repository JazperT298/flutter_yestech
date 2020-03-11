import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUsers(
    BuildContext context,String email, String password, String role) async {
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
          'role': role,
        });
        Provider.of<AuthProvider>(context).currentUserId = signedInUser.uid;
      }
    }catch(e){
      print(e);
    }
  }

  static void registerUsers(
      BuildContext context,String email, String password, String role) async {
    try{
      //showAlertDialog(context);
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null){
        final DatabaseReference _firebasedatabase = FirebaseDatabase.instance.reference().child("Users");

        _firebasedatabase.push().set({
          'id': signedInUser.uid,
          'email': email.toLowerCase(),
          'status':'offline',
          'search':'offline',
          'role':'1',
          'photoName':'offline',
        });
        Provider.of<AuthProvider>(context).currentUserId = signedInUser.uid;
      }
    }catch(e){
      print(e);
    }
  }
  static void logoutUsers(){
    _auth.signOut();
  }


  static void loginUsers( BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      Navigator.pop(context);
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