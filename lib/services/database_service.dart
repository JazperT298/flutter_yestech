import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/utils/constant.dart';

class DatabaseService {
  static void updateUser(UserEducator userEducator){
    usersRef.document(userEducator.id).updateData({
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

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users = usersRef.where('lastname', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

  static Future<QuerySnapshot> getAllUsers() {
    Future<QuerySnapshot> users = usersRef.getDocuments();
    return users;
  }

  static Future<UserEducator> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapShot = await usersRef.document(userId).get();

    if (userDocSnapShot.exists){
      return UserEducator.fromDoc(userDocSnapShot);
    }
    return UserEducator();
  }
}