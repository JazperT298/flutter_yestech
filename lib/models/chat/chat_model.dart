import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final String sender;
  final String receiver;
  final String message;
  final Timestamp time;
  final bool unread;

  Chat({this.id, this.sender, this.receiver, this.message, this.time, this.unread});

  factory Chat.fromDoc(DocumentSnapshot doc){
    return Chat(
      id: doc.documentID,
      sender: doc['sender'],
      receiver: doc['receiver'],
      message: doc['message'],
      time: doc['time'],
      unread: doc['unread'],
    );
  }




}