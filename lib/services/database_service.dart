import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_yestech/models/chat/chat_model.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/user_student.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/utils/constant.dart';

class DatabaseService {
  static void updateUsers(Users users){
    usersRef.document(users.user_id).updateData({
      'firsname': users.user_firstname,
      'lastname': users.user_lastname,
      'middlename': users.user_middlename,
      'suffix': users.user_suffixes,
      'gender': users.user_gender,
      'contact_number': users.user_contact_number,
      'educational_attainment': users.user_educational_attainment,
      'subj_major': users.user_subj_major,
      'current_school': users.user_current_school,
      'position': users.user_position,
      'facebook': users.user_facebook,
      'instagram': users.user_instagram,
      'twitter': users.user_twitter,
      'gmail': users.user_gmail,
      'motto': users.user_motto,
      'profileImageUrl': users.user_image,
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

  static void createChat(Chat chat) {
    chatsRef.document(chat.receiver).collection('chats').add({
      'sender': chat.sender,
      'receiver': chat.receiver,
      'message': chat.message,
      'time': chat.time,
      'unread': chat.unread,
    });
  }

  static Future<List<Chat>> getUserChat(String userId) async{
    QuerySnapshot userChatSnapShot = await chatsRef
        .document(userId)
        .collection('chats')
        .orderBy('time', descending: true)
        .getDocuments();

    List<Chat> chats = userChatSnapShot.documents.map((doc) => Chat.fromDoc(doc)).toList();

    return chats;
  }
  static Future<List<Chat>> getAllChats (String userId) async {
    QuerySnapshot userActivitiesSnapshot = await chatsRef
        .document(userId)
        .collection('chats')
        .getDocuments();
    List<Chat> users = userActivitiesSnapshot.documents.map((doc) => Chat.fromDoc(doc)).toList();
    return users;
  }

}