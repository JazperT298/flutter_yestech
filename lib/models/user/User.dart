
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class Users extends Object with _$UsersSerializerMixin {
  String user_id;
  String user_token;
  String user_code;
  String user_email_address;
  String user_contact_number;
  String user_password;
  String user_firstname;
  String user_lastname;
  String user_middlename;
  String user_suffixes;
  String user_gender;
  String user_image;
  String user_educational_attainment;
  String user_subj_major;
  String user_current_school;
  String user_position;
  String user_activation;
  String validated;
  String user_is_deleted;
  String user_role;
  String user_facebook;
  String user_twitter;
  String user_instagram;
  String user_gmail;
  String user_motto;
  String user_nickname;
  String user_dreamjob;

  Users(
      { this.user_id,
        this.user_token,
        this.user_code,
        this.user_email_address,
        this.user_contact_number,
        this.user_password,
        this.user_firstname,
        this.user_lastname,
        this.user_middlename,
        this.user_suffixes,
        this.user_gender,
        this.user_image,
        this.user_educational_attainment,
        this.user_subj_major,
        this.user_current_school,
        this.user_position,
        this.user_activation,
        this.validated,
        this.user_is_deleted,
        this.user_role,
        this.user_facebook,
        this.user_twitter,
        this.user_instagram,
        this.user_gmail,
        this.user_motto,
        this.user_nickname,
        this.user_dreamjob
      });

  factory Users.fromDoc(DocumentSnapshot doc){
    return Users(
      user_id: doc.documentID,
      user_email_address: doc['email'],
      user_password: doc['password'],
      user_firstname: doc['firsname'],
      user_lastname: doc['lastname'],
      user_middlename: doc['middlename'],
      user_suffixes: doc['suffix']?? '',
      user_gender: doc['gender'] ?? '',
      user_contact_number: doc['contact_number'] ?? '',
      user_image: doc['profileImageUrl'] ?? '',
      user_educational_attainment: doc['educational_attainment'] ?? '',
      user_subj_major: doc['subj_major'] ?? '',
      user_current_school: doc['current_school'] ?? '',
      user_position: doc['position'] ?? '',
      user_facebook: doc['facebook'] ?? '',
      user_instagram: doc['instagram'] ?? '',
      user_twitter: doc['twitter'] ?? '',
      user_gmail: doc['gmail'] ?? '',
      user_motto: doc['motto'] ?? '',
      user_activation: doc['user_activation'] ?? '',
      user_role: doc['user_role'] ?? '',
      validated: doc['validated'] ?? '',
    );
  }

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
