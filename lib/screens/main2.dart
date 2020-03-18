import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/user_data.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/login_screen.dart';
import 'package:flutter_yestech/screens/onboarding_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/screens/signup_screen.dart';
import 'package:flutter_yestech/screens/splash_screen.dart';
import 'package:flutter_yestech/screens/start_screen.dart';
import 'package:provider/provider.dart';

class MyApp2 extends StatelessWidget {

  static final String id = 'main2';

//  Widget _getScreenId(){
//    return StreamBuilder<FirebaseUser>(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (BuildContext context, snapshot) {
//        if (snapshot.hasData){
//          Provider.of<AuthProvider> (context).currentUserId = snapshot.data.uid;
//          return Consumer<AuthProvider>(
//            builder: (context, user, child) {
//              switch (user.status) {
//                case Status.Uninitialized:
//                  return SplashScreen();
//                case Status.Unauthenticated:
//                  return StartScreen();
//                case Status.Authenticated:
//                  return HomeScreen();
//                default:
//                  return StartScreen();
//              }
//            },
//          );
//        }else {
//          return StartScreen();
//        }
//      },
//    );
//
//  }

  Widget _getScreenId(){

    return Consumer<AuthProvider>(
        builder: (context, user, child) {
      switch (user.status) {
        case Status.Uninitialized:
          return SplashScreen();
        case Status.Unauthenticated:
          return StartScreen();
        case Status.Authenticated:
          return HomeScreen();
        default:
          return StartScreen();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Yestech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: Colors.black,
          ),
          // primarySwatch: Colors.blue,
        ),
        home: _getScreenId(),
        routes: {
          OnboardingScreen.id: (context) => OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          StartScreen.id: (context) => StartScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
        },
      ),
    );

  }
}