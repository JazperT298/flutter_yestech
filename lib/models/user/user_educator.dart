import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserEducator extends Object with _$UserSerializerMixin{
  final String id;
  final String token;
  final String email;
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


  UserEducator({
    this.id,
    this.token,
    this.email,
    this.password,
    this.firsname,
    this.lastname,
    this.middlename,
    this.suffix,
    this.gender,
    this.contact_number,
    this.profileImageUrl,
    this.educational_attainment,
    this.subj_major,
    this.current_school,
    this.position,
    this.facebook,
    this.instagram,
    this.twitter,
    this.gmail,
    this.motto,
    this.user_activation,
    this.user_role,
    this.validated,
    this.connection,
    this.firebase_token
  });

  factory UserEducator.fromDoc(DocumentSnapshot doc){
    return UserEducator(
      id: doc.documentID,
      email: doc['email'],
      password: doc['password'],
      firsname: doc['firsname'],
      lastname: doc['lastname'],
      middlename: doc['middlename'],
      suffix: doc['suffix']?? '',
      gender: doc['gender'] ?? '',
      contact_number: doc['contact_number'] ?? '',
      profileImageUrl: doc['profileImageUrl'] ?? '',
      educational_attainment: doc['educational_attainment'] ?? '',
      subj_major: doc['subj_major'] ?? '',
      current_school: doc['current_school'] ?? '',
      position: doc['position'] ?? '',
      facebook: doc['facebook'] ?? '',
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
  factory UserEducator.fromJson(Map<String, dynamic> json) {
    return new UserEducator(
        token: json['token'] ,
        email: json['email'] ,
        password: json['password'],
        firsname: json['firsname'],
        lastname: json['lastname'],
        middlename: json['middlename'] ,
        suffix: json['suffix'] ,
        gender: json['gender']  ,
        contact_number: json['contact_number'],
        profileImageUrl: json['profileImageUrl'] ,
        educational_attainment: json['educational_attainment'],
        subj_major: json['subj_major'] ,
        current_school: json['current_school'] ,
        position: json['position'] ,
        facebook: json['facebook'] ,
        instagram: json['instagram'] ,
        twitter: json['twitter'] ,
        gmail: json['gmail']  ,
        motto: json['motto'] ,
        user_activation: json['user_activation'] ,
        user_role: json['user_role']  ,
        validated: json['validated']  ,
        connection: json['connection']  ,
        firebase_token: json['firebase_token']
    );
  }

}

abstract class _$UserSerializerMixin {
  String get token;
  String get email;
  String get password;
  String get firsname;
  String get lastname;
  String get middlename;
  String get suffix;
  String get gender;
  String get contact_number;
  String get profileImageUrl;
  String get educational_attainment;
  String get subj_major;
  String get current_school;
  String get position;
  String get facebook;
  String get instagram;
  String get twitter;
  String get gmail;
  String get motto;
  String get user_activation;
  String get user_role;
  String get validated;
  String get connection;
  String get firebase_token;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'email': email,
    'password': password,
    'firsname': firsname,
    'lastname': lastname,
    'middlename': middlename,
    'suffix': suffix,
    'gender': gender,
    'contact_number': contact_number,
    'profileImageUrl': profileImageUrl,
    'educational_attainment': educational_attainment,
    'subj_major': subj_major,
    'current_school': current_school,
    'position': position,
    'facebook': facebook,
    'instagram': instagram,
    'twitter': twitter,
    'gmail': gmail,
    'motto': motto,
    'user_activation': user_activation,
    'user_role': user_role,
    'validated': validated,
    'connection': connection,
    'firebase_token': firebase_token
  };
}
