

import 'package:cloud_firestore/cloud_firestore.dart';

class UserStudent {
  final String id;
  final String token;
  final String email_address;
  final String password;
  final String firsname;
  final String lastname;
  final String middlename;
  final String suffix;
  final String gender;
  final String contact_number;
  final String profileImageUrl;
  final String educational_attainment;
  final String subj_major;
  final String current_school;
  final String position;
  final String facebook;
  final String instagram;
  final String twitter;
  final String gmail;
  final String motto;
  final String user_activation;
  final String user_role;
  final String validated;
  final String connection;
  final String firebase_token;


  UserStudent({this.id, this.token, this.email_address, this.password,
    this.firsname, this.lastname, this.middlename, this.suffix, this.gender,
    this.contact_number, this.profileImageUrl, this.educational_attainment,
    this.subj_major, this.current_school, this.position, this.facebook,
    this.instagram, this.twitter, this.gmail, this.motto,
    this.user_activation, this.user_role, this.validated, this.connection,
    this.firebase_token});

  factory UserStudent.fromDoc(DocumentSnapshot doc){
    return UserStudent(
      id: doc.documentID,
      token: doc['token'],
      email_address: doc['email_address'],
      password: doc['password'],
      firsname: doc['firsname'],
      lastname: doc['lastname'],
      middlename: doc['middlename'],
      suffix: doc['suffix'] ?? '',
      gender: doc['gender'] ?? '',
      contact_number: doc['contact_number'] ?? '',
      profileImageUrl: doc['profileImageUrl'] ?? '',
      educational_attainment: doc['educational_attainment'] ?? '',
      subj_major: doc['subj_major'] ?? '',
      current_school: doc['current_school'] ?? '',
      position: doc['facebook'] ?? '',
      instagram: doc['instagram'] ?? '',
      twitter: doc['twitter'] ?? '',
      gmail: doc['gmail'] ?? '',
      motto: doc['motto'] ?? '',
      user_activation: doc['user_activation'] ?? '',
      user_role: doc['user_role'] ?? '',
      validated: doc['validated'] ?? '',
      connection: doc['connection'] ?? '',
      firebase_token: doc['firebase_token'],
    );
  }
}