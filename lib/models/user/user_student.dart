import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserStudent extends Object with _$UserSerializerMixin{
  final String id;
  final String token;
  final String code;
  final String email_address;
  final String password;
  final String firsname;
  final String lastname;
  final String middlename;
  final String suffix;
  final String gender;
  final String contact_number;
  final String profileImageUrl;
  final String user_activation;
  final String user_role;
  final String firebase_token;


  UserStudent({this.id, this.token,this.code, this.email_address, this.password,
    this.firsname, this.lastname, this.middlename, this.suffix, this.gender,
    this.contact_number, this.profileImageUrl, this.user_activation, this.user_role,
    this.firebase_token});

  factory UserStudent.fromDoc(DocumentSnapshot doc){
    return UserStudent(
      id: doc.documentID,
      token: doc['token'],
      code: doc['code'],
      email_address: doc['email_address'],
      password: doc['password'],
      firsname: doc['firsname'],
      lastname: doc['lastname'],
      middlename: doc['middlename'],
      suffix: doc['suffix'] ?? '',
      gender: doc['gender'] ?? '',
      contact_number: doc['contact_number'] ?? '',
      profileImageUrl: doc['profileImageUrl'] ?? '',
      user_activation: doc['user_activation'] ?? '',
      user_role: doc['user_role'] ?? '',
      firebase_token: doc['firebase_token'],
    );
  }
  factory UserStudent.fromJson(Map<String, dynamic> json) {
    return new UserStudent(
        token: json['token'] ,
        code: json['code'] ,
        email_address: json['email_address'] ,
        password: json['password'],
        firsname: json['firsname'],
        lastname: json['lastname'],
        middlename: json['middlename'] ,
        suffix: json['suffix'] ,
        gender: json['gender']  ,
        contact_number: json['contact_number'],
        profileImageUrl: json['profileImageUrl'] ,
        user_activation: json['user_activation'] ,
        user_role: json['user_role']  ,
        firebase_token: json['firebase_token']
    );
  }
}

abstract class _$UserSerializerMixin {
  String get token;
  String get code;
  String get email_address;
  String get password;
  String get firsname;
  String get lastname;
  String get middlename;
  String get suffix;
  String get gender;
  String get contact_number;
  String get profileImageUrl;
  String get user_activation;
  String get user_role;
  String get firebase_token;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'code': code,
    'email_address': email_address,
    'password': password,
    'firsname': firsname,
    'lastname': lastname,
    'middlename': middlename,
    'suffix': suffix,
    'gender': gender,
    'contact_number': contact_number,
    'profileImageUrl': profileImageUrl,
    'user_activation': user_activation,
    'user_role': user_role,
    'firebase_token': firebase_token
  };
}