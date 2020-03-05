import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/chat/message.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/services/database_service.dart';

import 'chat_screen.dart';

class FavoriteContacts extends StatefulWidget {
  final String currentUserId;
  final String userId;

  FavoriteContacts({this.currentUserId, this.userId});

  @override
  _FavoriteContactsState createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  Future<QuerySnapshot> _user;

  List<Users> _users = [];

  @override
  void initState() {
    super.initState();
    print(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Container(height: 120.0,
            child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: _users.length,
              itemBuilder: (BuildContext context, int index){
              return FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Users users = Users.fromDoc(snapshot.data);
                  print(users.email);
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreens(
                            users: _users[index],
                          ),
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(_users[index].profileImageUrl),
                          ),
                          SizedBox(height: 6.0,),
                          Text(_users[index].email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),),
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
    );

  }
}
