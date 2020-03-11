import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class Users {
   String id;
   String token;
   String email;
   String password;
   String firsname;
   String lastname;
   String middlename;
   String suffix;
   String gender;
   String contact_number;
   String profileImageUrl;
   String educational_attainment;
   String subj_major;
   String current_school;
   String position;
   String facebook;
   String instagram;
   String twitter;
   String gmail;
   String motto;
   String user_activation;
   String user_role;
   String validated;
   String connection;
   String firebase_token;

  Users({
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

   Users.withId(
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
   );

   String get _id => id;
   String get _token => token;
   String get _email => email;
   String get _password => password;
   String get _firsname => firsname;
   String get _lastname => lastname;
   String get _middlename => middlename;
   String get _suffix => suffix;
   String get _gender => gender;
   String get _contact_number => contact_number;
   String get _profileImageUrl => profileImageUrl;
   String get _educational_attainment => educational_attainment;
   String get _subj_major => subj_major;
   String get _current_school => current_school;
   String get _position => position;
   String get _facebook => facebook;
   String get _instagram => instagram;
   String get _twitter => twitter;
   String get _gmail => gmail;
   String get _motto => motto;
   String get _user_activation => user_activation;
   String get _user_role => user_role;
   String get _validated => validated;
   String get _connection => connection;
   String get _firebase_token => firebase_token;

   set _id(String newId){ this.id = newId;}

   set _token(String newToken){ this.token = newToken;}

   set _email(String newEmail){ this.email = newEmail;}

   set _password(String newPassword){ this.password = newPassword;}

   set _firsname(String newFirstname){ this.firsname = newFirstname;}

   set _lastname(String newLastname){ this.lastname = newLastname;}

   set _middlename(String newMiddlename){ this.middlename = newMiddlename;}

   set _suffix(String newSuffix){ this.suffix = newSuffix;}

   set _gender(String newGender){ this.gender = newGender;}

   set _contact_number(String newContactNumber){ this.contact_number = newContactNumber;}

   set _profileImageUrl(String newProfileImageUrl){ this.profileImageUrl = newProfileImageUrl;}

   set _educational_attainment(String newEducationalAttainment){ this.educational_attainment = newEducationalAttainment;}

   set _subj_major(String newSubjMajor){ this.subj_major = newSubjMajor;}

   set _current_school(String newCurrentSchool){ this.current_school = newCurrentSchool;}

   set _position(String newPosition){ this.position = newPosition;}

   set _facebook(String newFacebook){ this.facebook = newFacebook;}

   set _instagram(String newInstagram){ this.instagram = newInstagram;}

   set _twitter(String newTwitter){ this.twitter = newTwitter;}

   set _gmail(String newGmail){ this.gmail = newGmail;}

   set _motto(String newMotto){ this.motto = newMotto;}

   set _user_activation(String newUserActivation){ this.user_activation = newUserActivation;}

   set _user_role(String newUserRole){ this.user_role = newUserRole;}

   set _validated(String newValidated){ this.validated = newValidated;}

   set _connection(String newConnection){ this.connection = newConnection;}

   set _firebase_token(String newFirebaseToken){ this.firebase_token = newFirebaseToken;}


   factory Users.fromDoc(DocumentSnapshot doc){
    return Users(
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

  factory Users.fromMap(Map<String, dynamic> map){
    return Users(
      id: map['user_id'],
      email: map['email'],
      password: map['password'],
      firsname: map['firsname'],
      lastname: map['lastname'],
      middlename: map['middlename'],
      suffix: map['suffix']?? '',
      gender: map['gender'] ?? '',
      contact_number: map['contact_number'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      educational_attainment: map['educational_attainment'] ?? '',
      subj_major: map['subj_major'] ?? '',
      current_school: map['current_school'] ?? '',
      position: map['position'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      twitter: map['twitter'] ?? '',
      gmail: map['gmail'] ?? '',
      motto: map['motto'] ?? '',
      user_activation: map['user_activation'] ?? '',
      user_role: map['user_role'] ?? '',
      validated: map['validated'] ?? '',
      connection: map['connection'] ?? '',
      firebase_token: map['firebase_token'],
    );
  }
  factory Users.fromJson(Map<String, dynamic> json) {
    return new Users(
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
