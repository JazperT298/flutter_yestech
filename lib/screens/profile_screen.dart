import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/screens/edit_profile_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'dart:math' as math;

import 'package:flutter_yestech/utils/network_image.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static final String id = 'profile';
  final String currentUserId;
  final String userId;

  ProfileScreen({this.currentUserId, this.userId});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';
  Users _profileUser;
  String userids;

  @override
  void initState(){
    super.initState();
    _setupProfileUser();
    print('dashboard  $widget.userId');
  }

  _setupProfileUser() async {
    Users profileUser = await DatabaseService.getUsersWithId(widget.userId);
    setState(() {
      _profileUser = profileUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: FutureBuilder(
        future: usersRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          Users users = Users.fromDoc(snapshot.data);
          return SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: users.profileImageUrl.isEmpty
                      ? PNetworkImage(
                        image,
                        fit: BoxFit.cover,)
                      : PNetworkImage(users.profileImageUrl,
                      fit: BoxFit.cover,),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.only(top: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 96.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        users.firsname == null
                                            ? users.email
                                            : users.firsname + ' ' + users.middlename.substring(0, 1) + '.' +  ' ' + users.lastname,
                                        style: Theme.of(context).textTheme.title,),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text(
                                            users.motto.isEmpty
                                            ? "Mobile App Developer" : users.motto
                                        ),
                                        subtitle: Text("CDO, Canada"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: <Widget>[
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Text("285"),
                                        Text("Likes")
                                      ],
                                    ),),
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Text("3025"),
                                        Text("Comments")
                                      ],
                                    ),),
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Text("650"),
                                        Text("Favourites")
                                      ],
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: users.profileImageUrl.isEmpty ?
                                    CachedNetworkImageProvider(image): CachedNetworkImageProvider(users.profileImageUrl),
                                    fit: BoxFit.cover
                                )
                            ),
                            margin: EdgeInsets.only(left: 16.0),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(title: Text("User information"),),
                            Divider(),
                            ListTile(
                              title: Text("Email"),
                              subtitle: Text(
                                  users.email.isEmpty
                                      ? "vanne.marsmylle@gmail.com" : users.email
                              ),
                              leading: Icon(Icons.email),
                            ),
                            ListTile(
                              title: Text("Phone"),
                              subtitle: Text(
                                  users.contact_number.isEmpty
                                      ? "+977-9815225566" : users.contact_number
                              ),
                              leading: Icon(Icons.phone),
                            ),
                            ListTile(
                              title: Text("Facebook"),
                              subtitle: Text(
                                  users.facebook.isEmpty
                                      ? "facebook.com" : users.facebook
                              ),
                              leading: Icon(Icons.face),
                            ),
                            ListTile(
                              title: Text("Instagram"),
                              subtitle: Text(
                                  users.instagram.isEmpty
                                      ? "instagram.com" : users.instagram
                              ),
                              leading: Icon(Icons.my_location),
                            ),
                            ListTile(
                              title: Text("Twitter"),
                              subtitle: Text(
                                  users.twitter.isEmpty
                                      ? "twitter.com" : users.twitter
                              ),
                              leading: Icon(Icons.web),
                            ),
                            ListTile(
                              title: Text("About"),
                              subtitle: Text("Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                              leading: Icon(Icons.person),
                            ),
                            ListTile(
                              title: Text("Joined Date"),
                              subtitle: Text("15 February 2019"),
                              leading: Icon(Icons.calendar_view_day),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.more_vert,
//                      ),
//                      onPressed: () => _simplePopup,
//                    ),
                    PopupMenuButton<String>(
                      onSelected: choiceAction,
                      itemBuilder: (BuildContext context) {
                        return Constants.choices.map((String choices) {
                          return PopupMenuItem<String>(
                            value: choices,
                            child: Text(
                                choices
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  Widget _simplePopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: GestureDetector(
          onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen()),),
            child: Text(
                "Update Profile"
            )
        ),
      ),
    ],
  );

  void choiceAction(String choice){
    if (choice == Constants.Settings){
      print('Settings');
    }else if (choice == Constants.Logout){
      print('Logout');
    }
    else if (choice == Constants.EditProfile){
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen(users: _profileUser,)),);
    }
  }
}
class Constants {
  static const String Settings = 'Settings';
  static const String Logout = 'Logout';
  static const String EditProfile = 'Edit Profile';

  static const List<String> choices = <String>[
    Settings,
    Logout,
    EditProfile
  ];
}
