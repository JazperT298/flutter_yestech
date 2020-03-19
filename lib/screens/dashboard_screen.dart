import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/feed_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/screens/quiz_screen.dart';
import 'package:flutter_yestech/screens/start_screen.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:flutter_yestech/widgets/dashboard/connections/connections_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/courses/courses_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/myvideos/myvideos_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/notes/notes_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/subject_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/videolab/videolab_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class DashboardScreen extends StatefulWidget {
  static final String id = 'dashboard_screen';
  Users users;

  DashboardScreen({this.users});
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
enum Departments { Profile, Logout }
class _DashboardScreenState extends State<DashboardScreen> {
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';
  final TextStyle whiteText = TextStyle(color: Colors.white);

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
  void initState() {
    super.initState();
    print('FUCKSHIT');
    //_getUserId();
    //initUserProfile();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      _buildBody(context),
//      FutureBuilder(
//          future: AuthProvider.getUserProfile(),
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            if (!snapshot.hasData) {
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//            return _buildBody(context);
//          }),

//          return _buildBody(context)),
    );
  }
  Widget _buildBody(BuildContext context) {
    final String currentUserId = Provider.of<AuthProvider> (context).currentUserId;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Statistics",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Card(
            elevation: 4.0,
            color: Colors.white,
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.subject),
                          color: Colors.blueAccent,
                          iconSize: 30.0,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        '100 Subjects',
                        style: TextStyle(
                            color: Colors.black54,
                          fontSize: 11.0
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      )
                    ],
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.red.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.account_circle),
                          color: Colors.redAccent,
                          iconSize: 30.0,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        '100 Students',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11.0
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      )
                    ],
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.green.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.today),
                          color: Colors.greenAccent,
                          iconSize: 30.0,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        '100 Topics',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11.0
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.red,
                      icon: Icons.subject,
                      title: "Subjects",
                      data: "1200",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotesScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.purple,
                      icon: Icons.note,
                      title: "Notes",
                      data: "857",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConnectionScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.language,
                      title: "Connections",
                      data: "864",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FeedScreen(
                          currentUserId: currentUserId,
                          userId : currentUserId,
                        ),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.green,
                      icon: Icons.assignment,
                      title: "NewFeeds",
                      data: "857",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideolabScreen(
                        ),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.indigo,
                      icon: Icons.video_library,
                      title: "Video Lab",
                      data: "698",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CoursesScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.lightBlue,
                      icon: Icons.payment,
                      title: "Courses",
                      data: "100",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyVideosScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.lightGreen,
                      icon: Icons.ondemand_video,
                      title: "My Videos",
                      data: "100",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Container _buildHeader() {
    final String currentUserId = Provider.of<AuthProvider> (context).currentUserId;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Dashboard",
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            trailing: CircleAvatar(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(users: users,),),
                  );
                },
              ),
              radius: 25.0,
              backgroundImage: users.user_image == null || users.user_image == 'null'
                ? CachedNetworkImageProvider(image)
                  : CachedNetworkImageProvider(users.user_image),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              users.user_firstname == null
                  ? users.user_email_address
                  : users.user_firstname + ' ' + users.user_middlename.substring(0, 1) + '.' +  ' ' + users.user_lastname,
              style: whiteText.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              users.user_motto == null
                  ? "Mobile App Developer" : users.user_motto,
              style: whiteText,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTile(
      {Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: whiteText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style:
            whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }


  _showProfileDialog(BuildContext context) {
    return showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text("Educator"),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text("Profile"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(users: users,),),
                ).then((value) { Navigator.pop(context);});
              },
            ),
            new SimpleDialogOption(
              child: new Text("Logout"),
              onPressed: (){
//                Navigator.pop(context, Answers.NO);
              },
            ),
          ],
        ),
    );
  }
}
