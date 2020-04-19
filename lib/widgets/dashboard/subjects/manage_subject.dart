import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/screens/dashboard_screen.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/widgets/dashboard/notes/notes_screen.dart';

class ManageSubject extends StatefulWidget {
  final Subject subject;

  ManageSubject(this.subject);
  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  _ManageSubjectState createState() => _ManageSubjectState();
}

class _ManageSubjectState extends State<ManageSubject> {

  Subject subject;

  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
            widget.subject.subj_title
        ),
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
      body: Stack(
        children: <Widget>[
//          ClipPath(
//            clipper: WaveClipperTwo(),
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.red
//              ),
//              height: 200,
//            ),
//          ),
          _buildBody(context),
        ],
      ),

    );
  }
  Widget _buildBody(BuildContext context) {
    //final String currentUserId = Provider.of<AuthProvider> (context).currentUserId;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20.0),
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
                        //builder: (_) => SubjectScreen(userid: users.user_id, token: users.user_token,),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.red,
                      icon: Icons.details,
                      title: "View Details",
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
                      color: Colors.yellow,
                      icon: Icons.account_balance,
                      title: "View Students",
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
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (_) => SubjectScreen(userid: users.user_id, token: users.user_token,),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.blue,
                      icon: Icons.lightbulb_outline,
                      title: "View Topics",
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
                      color: Colors.lightGreen,
                      icon: Icons.gradient,
                      title: "View Quizzes",
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
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (_) => SubjectScreen(userid: users.user_id, token: users.user_token,),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.blueAccent,
                      icon: Icons.star_half,
                      title: "View Stickers",
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
                        builder: (_) => NotesScreen(),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.green,
                      icon: Icons.star,
                      title: "View Awards",
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
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (_) => SubjectScreen(userid: users.user_id, token: users.user_token,),
                      ),
                    ),
                    child: _buildTile(
                      color: Colors.orange,
                      icon: Icons.assessment,
                      title: "View Assessment",
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
                      color: Colors.pinkAccent,
                      icon: Icons.note,
                      title: "View Notes",
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

  Container _buildTile(
      {Color color, IconData icon, String title}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Center(
            child: Text(
              title,
              style: whiteText.copyWith(fontSize: 15.0),
            ),
          ),
//          Text(
//            data,
//            style:
//            whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
//          ),
        ],
      ),
    );
  }
  void choiceAction(String choice){
    if (choice == Constants.Dashboard){
      print('Dashboard');
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_) => HomeScreen()),);
    }
    else if (choice == Constants.Profile){
      //Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen(users: _profileUser,)),);
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_) => ProfileScreen()),);
    }
  }
}


class Constants {
  static const String Dashboard = 'Dashboard';
  static const String Profile = 'Profile';

  static const List<String> choices = <String>[
    Dashboard,
    Profile
  ];
}

