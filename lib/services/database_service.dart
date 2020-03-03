import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/user_student.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/utils/constant.dart';

class DatabaseService {
  static void updateUserEducator(UserEducator userEducator){
    usersEducRef.document(userEducator.id).updateData({
      'firsname': userEducator.firsname,
      'lastname': userEducator.lastname,
      'middlename': userEducator.middlename,
      'suffix': userEducator.suffix,
      'gender': userEducator.gender,
      'contact_number': userEducator.contact_number,
      'educational_attainment': userEducator.educational_attainment,
      'subj_major': userEducator.subj_major,
      'current_school': userEducator.current_school,
      'position': userEducator.position,
      'facebook': userEducator.facebook,
      'instagram': userEducator.instagram,
      'twitter': userEducator.twitter,
      'gmail': userEducator.gmail,
      'motto': userEducator.motto,
      'profileImageUrl': userEducator.profileImageUrl,
    });
  }

  static Future<QuerySnapshot> searchUserEducator(String name) {
    Future<QuerySnapshot> users = usersEducRef.where('lastname', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

  static Future<QuerySnapshot> getAllUserEducator() {
    Future<QuerySnapshot> users = usersEducRef.getDocuments();
    return users;
  }

  static Future<UserEducator> getUserEducatorWithId(String userId) async {
    DocumentSnapshot userDocSnapShot = await usersEducRef.document(userId).get();

    if (userDocSnapShot.exists){
      return UserEducator.fromDoc(userDocSnapShot);
    }
    return UserEducator();
  }

  static Future<QuerySnapshot> searchUserStudent(String name) {
    Future<QuerySnapshot> users = usersStudRef.where('lastname', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

  static Future<QuerySnapshot> getAllUserStudent() {
    Future<QuerySnapshot> users = usersStudRef.getDocuments();
    return users;
  }

  static Future<UserStudent> getUserStudentWithId(String userId) async {
    DocumentSnapshot userDocSnapShot = await usersStudRef.document(userId).get();

    if (userDocSnapShot.exists){
      return UserStudent.fromDoc(userDocSnapShot);
    }
    return UserStudent();
  }
}