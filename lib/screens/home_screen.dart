import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/chat_screen.dart';
import 'package:flutter_yestech/screens/dashboard_screen.dart';
import 'package:flutter_yestech/screens/feed_screen.dart';
import 'package:flutter_yestech/screens/menu_screen.dart';
import 'package:flutter_yestech/screens/notification_screen.dart';
import 'package:flutter_yestech/screens/rank_screen.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  static final String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Users users;

  int _currentTab = 0;
  PageController _pageController;


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
    _pageController = PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          DashboardScreen(users: users,),
          ChatScreen(users: users,),
          MenuScreen(),
        ],
        onPageChanged: (int index) {
          setState((){
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentTab,
          onTap: (int index){
            setState((){
              _currentTab = index;
            });
            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 32.0,
              ),
            ),
          ]
      ),
    );
  }
}
