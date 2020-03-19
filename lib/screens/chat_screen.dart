import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/chat/chat_model.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/widgets/chat/category_selector.dart';
import 'package:flutter_yestech/widgets/chat/favorite_contacts.dart';
import 'package:flutter_yestech/widgets/chat/recent_chats.dart';
import 'package:flutter_yestech/widgets/chat/chat_screen.dart';

class ChatScreen extends StatefulWidget {

  static final String id = 'chat_screen';
  Users users;

  ChatScreen({this.users});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';

  List<Users> _users = [];
  List<Chat> _chats = [];
  Users users;

  @override
  void initState() {
    super.initState();
    _getAllUser();
  }
  _getAllUser() async {
    List<Users> users = (await DatabaseService.getAllUsers());
    setState(() {
      _users = users;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('number of users :');
    print(_users.length);
    print('FUCKING WHORE SHIT NIGGA');
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          iconSize: 30.0,
//          color: Colors.white,
//          onPressed: () {},
//        ),

        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )
                ),
                child: Column(
                  children: <Widget>[
                Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Favorite Contacts', style: TextStyle( color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, ), ),
                          IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                            ),
                            iconSize: 30.0,
                            color: Colors.white,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(height: 100.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 10.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: _users.length,
                          itemBuilder: (BuildContext context, int index){
                            Users user = _users[index];
                            return FutureBuilder(
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                Users users = snapshot.data;
                                print(user.user_email_address);
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ChatScreens(
                                          //users: _users[index], userId: widget.userId, currentUserId: widget.currentUserId,
                                        ),
                                      )
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 35.0,
                                          backgroundImage: _users[index].user_image == null
                                              ? CachedNetworkImageProvider(image)
                                              : CachedNetworkImageProvider(_users[index].user_image),
                                        ),
                                        //SizedBox(height: 6.0,),
//                                        Text(_users[index].email,
//                                          style: TextStyle(
//                                            color: Colors.white,
//                                            fontSize: 16.0,
//                                            fontWeight: FontWeight.w600,
//                                          ),
//                                        ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                  //RecentChats(users: users, userId: widget.userId, currentUserId: widget.currentUserId,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
