import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/login_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:flutter_yestech/utils/network_image.dart';
import 'package:flutter_yestech/utils/styles.dart';
import 'package:provider/provider.dart';

import 'package:toast/toast.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  final String roleId;

  const SignupScreen({Key key, this.roleId}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  String _message = '';

  Map response = new Map();

  final image = "assets/images/the_yes_logo.png";

  @override
  void initState() {
    super.initState();
    print(widget.roleId);
  }

  //Register Educator from API and Firebase
  Future<void> _registerUserEducator() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      response = await Provider.of<AuthProvider>(context)
          .registerEducator(_email, _password);
      if (response['success_educator']) {
        AuthService.signUpEducator(context, _email, _password);
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(roleId: widget.roleId)
          )
        );
        Navigator.pop(context);
      } else {
        setState(() {
          _message = response['message'];
        });
      }
    }
  }

  //Register Student from API and Firebase
  Future<void> _registerUserStudent() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      response = await Provider.of<AuthProvider>(context)
          .registerStudent(_email, _password);
      if (response['success']) {
        AuthService.signUpStudent(context, _email, _password);
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(roleId: widget.roleId)
          )
        );
        Navigator.pop(context);
      } else {
        setState(() {
          _message = response['message'];
        });
      }
    }
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 70.0,),
          CircleAvatar(child: PNetworkImage(image), maxRadius: 50, backgroundColor: Colors.transparent,),
          SizedBox(height: 20.0,),
          _buildLoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                onPressed: (){
                  Navigator.pop(context);
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 90.0,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.blue),
                          validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(Icons.email, color: Colors.blue,)
                          ),
                        )
                    ),
                    Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.blue),
                          validator: (input) => input.length < 6 ? 'Password be at least 6 characters' : null,
                          onSaved: (input) => _password = input,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, color: Colors.blue,)
                          ),
                        )
                    ),
                    Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.blue),
                          validator: (input) => input.length < 6 ? 'Password be at least 6 characters' : null,
                          onSaved: (input) => _password = input,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Confirm password",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, color: Colors.blue,)
                          ),
                        )
                    ),
                    Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                    SizedBox(height: 10.0,),

                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                // ignore: unrelated_type_equality_checks
                onPressed: checkUserId ,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                child: Text("Sign Up", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
  void checkUserId(){
    if (widget.roleId == '1'){
      _registerUserStudent();
    }else if (widget.roleId == '2'){
      _registerUserEducator();
    }
  }


//  Widget _buildEmailTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Email',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 45.0,
//          child: TextField(
//            keyboardType: TextInputType.emailAddress,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 10.0),
//              prefixIcon: Icon(
//                Icons.email,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Email',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//  Widget _buildPasswordTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Password',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 45.0,
//          child: TextField(
//            obscureText: true,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 10.0),
//              prefixIcon: Icon(
//                Icons.lock,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Password',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//  Widget _buildConfirmPasswordTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Confirm Password',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 45.0,
//          child: TextField(
//            obscureText: true,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 10.0),
//              prefixIcon: Icon(
//                Icons.lock,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Password',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//
//  Widget _buildSignupBtn() {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 25.0),
//      width: double.infinity,
//      child: RaisedButton(
//        elevation: 5.0,
//        onPressed: () => print('Sign up Button Pressed'),
//        padding: EdgeInsets.all(15.0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(30.0),
//        ),
//        color: Colors.white,
//        child: Text(
//          'Sign up',
//          style: TextStyle(
//            color: Color(0xFF527DAA),
//            letterSpacing: 1.5,
//            fontSize: 18.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: 'OpenSans',
//          ),
//        ),
//      ),
//    );
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: AnnotatedRegion<SystemUiOverlayStyle>(
//        value: SystemUiOverlayStyle.light,
//        child: GestureDetector(
//          onTap: () => FocusScope.of(context).unfocus(),
//          child: Stack(
//            children: <Widget>[
//              Container(
//                height: double.infinity,
//                width: double.infinity,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      Color(0xFF73AEF5),
//                      Color(0xFF61A4F1),
//                      Color(0xFF478DE0),
//                      Color(0xFF398AE5),
//                    ],
//                    stops: [0.1, 0.4, 0.7, 0.9],
//                  ),
//                ),
//              ),
//              Container(
//                height: double.infinity,
//                child: SingleChildScrollView(
//                  physics: AlwaysScrollableScrollPhysics(),
//                  padding: EdgeInsets.symmetric(
//                    horizontal: 40.0,
//                    vertical: 120.0,
//                  ),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Sign Up',
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontFamily: 'OpenSans',
//                          fontSize: 30.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                      SizedBox(height: 30.0),
//                      _buildEmailTF(),
//                      SizedBox(
//                        height: 30.0,
//                      ),
//                      _buildPasswordTF(),
//                      SizedBox(
//                        height: 30.0,
//                      ),
//                      _buildConfirmPasswordTF(),
//                      SizedBox(
//                        height: 30.0,
//                      ),
//                      _buildSignupBtn(),
//                    ],
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
