import 'package:flutter/material.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/login_screen.dart';
import 'package:flutter_yestech/screens/main2.dart';
import 'package:flutter_yestech/screens/onboarding_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/screens/signup_screen.dart';
import 'package:flutter_yestech/screens/splash_screen.dart';
import 'package:flutter_yestech/screens/start_screen.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/onboard": (BuildContext context) => OnboardingScreen(),
  "/myapp2": (BuildContext context) => MyApp2(),
  "/start": (BuildContext context) => StartScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/signup": (BuildContext context) => SignupScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes)
);


