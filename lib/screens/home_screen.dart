import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/screens/chat_screen.dart';
import 'package:flutter_yestech/screens/feed_screen.dart';
import 'package:flutter_yestech/screens/menu_screen.dart';
import 'package:flutter_yestech/screens/notification_screen.dart';
import 'package:flutter_yestech/screens/rank_screen.dart';

class HomeScreen extends StatefulWidget {

  static final String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentTab = 0;
  PageController _pageController;

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
          FeedScreen(),
          ChatScreen(),
          RankScreen(),
          NotificationScreen(),
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
                Icons.multiline_chart,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
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
