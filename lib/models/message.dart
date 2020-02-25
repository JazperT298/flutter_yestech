


import 'package:flutter_yestech/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({ this.sender, this.time, this.text, this.isLiked, this.unread });

}
  // You - current user
  final User currentUser  = User(id: 0, name: 'Current User', imageUrl: 'assets/images/sherry.jpg');

  // Users
  final User conan = User(id: 1, name: 'Conan', imageUrl: 'assets/images/conan.jpg');

  final User james = User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');

  final User john = User(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');

  final User kirk = User(id: 4, name: 'Kirk', imageUrl: 'assets/images/kirk.jpg');

  final User marty = User(id: 5, name: 'Marty', imageUrl: 'assets/images/marty.jpg');

  final User ran = User(id: 6, name: 'Ran', imageUrl: 'assets/images/ran.jpg');

  final User save = User(id: 7, name: 'Dave', imageUrl: 'assets/images/save.jpg');

  final User sherry = User(id: 8, name: 'Sherry', imageUrl: 'assets/images/sherry.jpg');

  final User shinichi = User(id: 9, name: 'Shinichi', imageUrl: 'assets/images/shinichi.jpg');

  final User soo = User(id: 10, name: 'Soo-In-Lee', imageUrl: 'assets/images/soo.jpg');

  //Favorite Contacts
  List<User> favorites = [conan, james, john, kirk, marty, soo];

  List<Message> chats = [
    Message(sender: conan, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: james, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: john, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),
    Message(sender: kirk, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: false, unread: true,),
    Message(sender: marty, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),
    Message(sender: soo, time: '5:30 PM', text: 'Hey, how\'s it going? what did you do today??', isLiked: true, unread: false,),

  ];

List<Message> messages = [
  Message(sender: soo, time: '3:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '4:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: soo, time: '6:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: soo, time: '7:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '8:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: soo, time: '9:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),

  Message(sender: conan, time: '3:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: conan, time: '4:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: currentUser, time: '6:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: conan, time: '7:30 PM', text: 'Hey, how\'s it going?', isLiked: false, unread: true,),
  Message(sender: conan, time: '8:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),
  Message(sender: currentUser, time: '9:30 PM', text: 'Hey, how\'s it going?', isLiked: true, unread: false,),

];

