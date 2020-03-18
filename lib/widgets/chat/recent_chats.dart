import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/chat/chat_model.dart';
import 'package:flutter_yestech/models/chat/message.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/widgets/chat/chat_screen.dart';

class RecentChats extends StatefulWidget {
  final Users users;
  final String currentUserId;
  final String userId;

  RecentChats({this.users, this.currentUserId, this.userId});
  @override
  _RecentChatsState createState() => _RecentChatsState();
}


class _RecentChatsState extends State<RecentChats> {

  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';

  List<Chat> _chats = [];

  @override
  void initState() {
    super.initState();
    _setupChats();
  }

  _setupChats() async {
    List<Chat> chats = await DatabaseService.getAllChats(widget.userId);
    setState(() {
      _chats = chats;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(_chats.length);
     return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index){
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreens(
                        users: chat.sender,
                      ),
                    )
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(radius: 35.0, backgroundImage: AssetImage(chat.sender.user_image),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text (
                                chat.sender.user_email_address,
                                style: TextStyle (color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                                ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.message,
                                  style: TextStyle (color: Colors.blueGrey, fontSize: 13.0, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(chat.time,
                            style: TextStyle (
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          chat.unread ? Container(
                            width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                  'NEW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ) : Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
