import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/models/user_models.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/feed_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/screens/quiz_screen.dart';
import 'package:flutter_yestech/screens/start_screen.dart';
import 'package:flutter_yestech/services/database_service.dart';
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
  final String currentUserId;
  final String userId;

  DashboardScreen({this.currentUserId, this.userId});
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';
  final TextStyle whiteText = TextStyle(color: Colors.white);

  Users users;

  @override
  void initState() {
    super.initState();
    print('FUCKSHIT');
    _getUserId();
    initUserProfile();
    checkLoginStatus();
  }
  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("user_token") == null) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StartScreen())
      );
    }
  }

  Future<void> initUserProfile() async {
    Users up = await AuthProvider.getUserProfile();
    setState(() {
      users = up;
    });
    print(users.email);
  }

  _getUserId() async{
    String user_id = await AuthProvider.getUserId();
    setState(() {
      users.id = user_id;
    });
    print(users.id);
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
              "Schedules",
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
                  child: ListTile(
                    leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 25,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 40,
                            width: 8.0,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 30,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    title: Text("Today"),
                    subtitle: Text("18 subjects"),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: ListTile(
                    leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 25,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 40,
                            width: 8.0,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 30,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    title: Text("Canceled"),
                    subtitle: Text("7 quizzes"),
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
                      data: "900",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
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
                      data: "857",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => showToast("Show Stickers Toast", gravity: Toast.BOTTOM),
                    child: _buildTile(
                      color: Colors.redAccent,
                      icon: Icons.stars,
                      title: "Stickers",
                      data: "698",
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
        color: Colors.blue,
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(currentUserId: currentUserId, userId : currentUserId,),
                  ),
                ),
              ),
              radius: 25.0,
              backgroundImage: users.profileImageUrl.isEmpty
                ? CachedNetworkImageProvider(image)
                  : CachedNetworkImageProvider(users.profileImageUrl),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              users.firsname == null
                  ? users.email
                  : users.firsname + ' ' + users.middlename.substring(0, 1) + '.' +  ' ' + users.lastname,
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
              users.motto.isEmpty
                  ? "Mobile App Developer" : users.motto,
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

}
