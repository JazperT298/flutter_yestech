
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String profileImageUrl;
  final String email;
  final String bio;

  User({this.id, this.profileImageUrl, this.email, this.bio});

  factory User.fromDoc(DocumentSnapshot doc){
    return User(
      id: doc.documentID,
      profileImageUrl: doc['profileImageUrl'],
      email: doc['email'],
      bio: doc['bio'] ?? '',
    );

  }
}