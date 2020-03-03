import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final _authEducator = FirebaseAuth.instance;
  static final _authStudent = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpEducator(
    BuildContext context,String email, String password) async {
    try{
        //showAlertDialog(context);
        AuthResult authResult = await _authEducator.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null){
        _firestore.collection('/userEducator').document(signedInUser.uid).setData({
          'email': email,
          'profileImageUrl': '',
        });
        Provider.of<AuthProvider>(context).currentUserId = signedInUser.uid;
      }
    }catch(e){
      print(e);
    }
  }
  static void signUpStudent(
      BuildContext context,String email, String password) async {
    try{
      //showAlertDialog(context);
      AuthResult authResult = await _authStudent.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null){
        _firestore.collection('/userStudent').document(signedInUser.uid).setData({
          'email': email,
          'profileImageUrl': '',
        });
        Provider.of<AuthProvider>(context).currentUserId = signedInUser.uid;
      }
    }catch(e){
      print(e);
    }
  }

  static void logoutEducator(){
    _authEducator.signOut();
  }

  static void logoutStudent(){
    _authEducator.signOut();
  }

  static void loginEduc( BuildContext context, String email, String password) async {
    try {
      await _authEducator.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
      ));
    }catch(e){
      print(e);
    }
  }

  static void loginStud( BuildContext context, String email, String password) async {
    try {
      await _authStudent.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
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