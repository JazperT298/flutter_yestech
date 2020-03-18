import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/screens/edit_profile_screen.dart';
import 'package:flutter_yestech/screens/start_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'dart:math' as math;

import 'package:flutter_yestech/utils/network_image.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static final String id = 'profile';
  Users users;

  ProfileScreen({this.users});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();

  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';
  Users _profileUser;
  String userids;
  Users users;

  //------------------------------------------------------------------------------

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (users == null) {
      await initUserProfile();
    }
  }

  //------------------------------------------------------------------------------

  Future<void> initUserProfile() async {
    Users up = await AppSharedPreferences.getUserProfile();
    setState(() {
      users = up;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: users.user_image == null
                      ? PNetworkImage(
                        image,
                        fit: BoxFit.cover,)
                      : PNetworkImage(users.user_image,
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
                                        users.user_firstname == null
                                            ? users.user_email_address
                                            : users.user_firstname + ' ' + users.user_middlename.substring(0, 1) + '.' +  ' ' + users.user_lastname,
                                        style: Theme.of(context).textTheme.title,),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text(
                                            users.user_motto == null
                                            ? "Mobile App Developer" : users.user_motto
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
                                        Text("100"),
                                        Text("Connections")
                                      ],
                                    ),),
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Text("100"),
                                        Text("Subjects")
                                      ],
                                    ),),
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Text("100"),
                                        Text("Students")
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
                                    image: users.user_image == null ?
                                    CachedNetworkImageProvider(image): CachedNetworkImageProvider(users.user_image),
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
                              title: Text("Name"),
                              subtitle: Text(
                                  users.user_firstname == null
                                      ? "Vanne Marsmyle Pagapong" : users.user_firstname
                              ),
                              leading: Image.asset(
                                "assets/images/ic_educator_profile.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Gender"),
                              subtitle: Text(
                                  users.user_gender == null
                                      ? "Male" : users.user_gender
                              ),
                              leading: Image.asset(
                                "assets/images/ic_gender_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Contact"),
                              subtitle: Text(
                                  users.user_contact_number == null
                                      ? "+977-9815225566" : users.user_contact_number
                              ),
                              leading: Image.asset(
                                "assets/images/ic_phone_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Email"),
                              subtitle: Text(
                                  users.user_email_address == null
                                      ? "vanne.marsmylle@gmail.com" : users.user_email_address
                              ),
                              leading: Image.asset(
                                "assets/images/ic_email_colroed.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Motto"),
                              subtitle: Text(
                                  users.user_motto == null
                                      ? "All of my Fucking friends are Metal" : users.user_motto
                              ),
                              leading: Image.asset(
                                "assets/images/ic_motto_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(title: Text("User Background"),),
                            Divider(),
                            ListTile(
                              title: Text("Educational Attainment"),
                              subtitle: Text(
                                  users.user_educational_attainment == null
                                      ? "Bachelor of Science in Information Technology" : users.user_educational_attainment
                              ),
                              leading: Image.asset(
                                "assets/images/ic_educational_attainment_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Subjects"),
                              subtitle: Text(
                                  users.user_subj_major == null
                                      ? "Programming" : users.user_subj_major
                              ),
                              leading: Image.asset(
                                "assets/images/ic_subjects_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Current School"),
                              subtitle: Text(
                                  users.user_current_school == null
                                      ? "Phinma-Cagayan de Oro College" : users.user_current_school
                              ),
                              leading: Image.asset(
                                "assets/images/ic_current_school_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("School Position"),
                              subtitle: Text(
                                  users.user_position == null
                                      ? "Faculty" : users.user_position
                              ),
                              leading: Image.asset(
                                "assets/images/ic_school_position_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(title: Text("Social Accounts"),),
                            Divider(),
                            ListTile(
                              title: Text("Facebook"),
                              subtitle: Text(
                                  users.user_facebook == null
                                      ? "facebook.com" : users.user_facebook
                              ),
                              leading: Image.asset(
                                "assets/images/ic_facebook_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Twitter"),
                              subtitle: Text(
                                  users.user_twitter == null
                                      ? "twitter.com" : users.user_twitter
                              ),
                              leading: Image.asset(
                                "assets/images/ic_twitter_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                            ListTile(
                              title: Text("Instagram"),
                              subtitle: Text(
                                  users.user_instagram == null
                                      ? "instagram.com" : users.user_instagram
                              ),
                              leading: Image.asset(
                                "assets/images/ic_instagram_colored.png",
                                height: 30.0, width: 30.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AppBar(
                  key: globalKey,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
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
          ),
        //}
      //),
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
      showDialog(
          barrierDismissible: false,
          context: globalKey.currentContext,
          child: _logOutDialog());
    }
    else if (choice == Constants.EditProfile){
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen(users: _profileUser,)),);
    }
  }

  //------------------------------------------------------------------------------

  Widget _logOutDialog() {
    return new AlertDialog(
      title: new Text(
        "Logout",
        style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
      ),
      content: new Text(
        "Are you sure you want to Logout from the App",
        style: new TextStyle(color: Colors.grey, fontSize: 20.0),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("OK",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            AppSharedPreferences.clear();
            Navigator.pushReplacement(
              globalKey.currentContext,
              new MaterialPageRoute(builder: (context) => new StartScreen()),
            );
          },
        ),
        new FlatButton(
          child: new Text("Cancel",
              style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
          onPressed: () {
            Navigator.of(globalKey.currentContext).pop();
          },
        ),
      ],
    );
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
