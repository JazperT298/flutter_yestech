import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/user_student.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/utils/constant.dart';

class DatabaseService {
  static void updateUsers(Users users){
    usersRef.document(users.id).updateData({
      'firsname': users.firsname,
      'lastname': users.lastname,
      'middlename': users.middlename,
      'suffix': users.suffix,
      'gender': users.gender,
      'contact_number': users.contact_number,
      'educational_attainment': users.educational_attainment,
      'subj_major': users.subj_major,
      'current_school': users.current_school,
      'position': users.position,
      'facebook': users.facebook,
      'instagram': users.instagram,
      'twitter': users.twitter,
      'gmail': users.gmail,
      'motto': users.motto,
      'profileImageUrl': users.profileImageUrl,
    });
  }

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users = usersRef.where('lastname', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

//  static Future<QuerySnapshot> getAllUsers() {
//    Future<QuerySnapshot> users = usersRef.getDocuments();
//    return users;
//  }

  static Future<List<Users>> getAllUsers () async {
    QuerySnapshot userActivitiesSnapshot = await Firestore.instance
        .collection('users')
        .getDocuments();
    List<Users> users = userActivitiesSnapshot.documents.map((doc) => Users.fromDoc(doc)).toList();
    return users;
  }

  static Future<Users> getUsersWithId(String userId) async {
    DocumentSnapshot userDocSnapShot = await usersRef.document(userId).get();

    if (userDocSnapShot.exists){
      return Users.fromDoc(userDocSnapShot);
    }
    return Users();
  }

}