import 'package:flutter_yestech/models/chat/user_model.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/services/database_service.dart';

class Message {
  final Users sender;
  final Users receiver;
  final String time;
  final String message;
  final bool isLiked;
  final bool unread;

  Message({ this.sender, this.receiver, this.time, this.message, this.isLiked, this.unread });

}
  // You - current user
  final Users currentUser  = Users(
      id:'0', email: 'Current User', profileImageUrl: 'assets/images/sherry.jpg');
  // Users
  final Users conan = Users(id: '1', email: 'Conan', profileImageUrl: 'assets/images/conan.jpg');
  final Users james = Users(id: '2', email: 'James', profileImageUrl: 'assets/images/james.jpg');
  final Users john = Users(id: '3', email: 'John', profileImageUrl: 'assets/images/john.jpg');
  final Users kirk = Users(id: '4', email: 'Kirk', profileImageUrl: 'assets/images/kirk.jpg');
  final Users marty = Users(id: '5', email: 'Marty', profileImageUrl: 'assets/images/marty.jpg');
  final Users ran = Users(id: '6', email: 'Ran', profileImageUrl: 'assets/images/ran.jpg');
  final Users save = Users(id:'7', email: 'Dave', profileImageUrl: 'assets/images/save.jpg');
  final Users sherry = Users(id: '8', email: 'Sherry', profileImageUrl: 'assets/images/sherry.jpg');
  final Users shinichi = Users(id:'9', email: 'Shinichi', profileImageUrl: 'assets/images/shinichi.jpg');
  final Users soo = Users(id: '10', email: 'Soo-In-Lee', profileImageUrl: 'assets/images/soo.jpg');

  //Favorite Contacts
  List<Users> favorites = [conan, james, john, kirk, marty, soo];

  List<Message> chats = [
    Message(sender: conan, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: james, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: john, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),
    Message(sender: kirk, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: marty, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),
    Message(sender: soo, time: '5:30 PM', message: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),

  ];

List<Message> messages = [
  Message(sender: soo, time: '3:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '4:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: soo, time: '6:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: soo, time: '7:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '8:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: soo, time: '9:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),

  Message(sender: conan, time: '3:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: conan, time: '4:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '6:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: conan, time: '7:30 PM', message: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: conan, time: '8:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: currentUser, time: '9:30 PM', message: 'Hey, how\'s it going?', isLiked: true, unread: false,),

];

