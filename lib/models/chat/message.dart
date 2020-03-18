import 'package:flutter_yestech/models/chat/user_model.dart';
import 'package:flutter_yestech/models/user/User.dart';

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
      user_id:'0', user_email_address: 'Current User', user_image: 'assets/images/sherry.jpg');
  // Users
  final Users conan = Users(user_id: '1', user_email_address: 'Conan', user_image: 'assets/images/conan.jpg');
  final Users james = Users(user_id: '2', user_email_address: 'James', user_image: 'assets/images/james.jpg');
  final Users john = Users(user_id: '3', user_email_address: 'John', user_image: 'assets/images/john.jpg');
  final Users kirk = Users(user_id: '4', user_email_address: 'Kirk', user_image: 'assets/images/kirk.jpg');
  final Users marty = Users(user_id: '5', user_email_address: 'Marty', user_image: 'assets/images/marty.jpg');
  final Users ran = Users(user_id: '6', user_email_address: 'Ran', user_image: 'assets/images/ran.jpg');
  final Users save = Users(user_id:'7', user_email_address: 'Dave', user_image: 'assets/images/save.jpg');
  final Users sherry = Users(user_id: '8', user_email_address: 'Sherry', user_image: 'assets/images/sherry.jpg');
  final Users shinichi = Users(user_id:'9', user_email_address: 'Shinichi', user_image: 'assets/images/shinichi.jpg');
  final Users soo = Users(user_id: '10', user_email_address: 'Soo-In-Lee', user_image: 'assets/images/soo.jpg');

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

