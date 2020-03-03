import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/signup_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/utils/network_image.dart';
import 'package:flutter_yestech/utils/styles.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_screen';

  final String roleId;

  const LoginScreen({Key key, this.roleId}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final image = "assets/images/the_yes_logo.png";
  bool _rememberMe = false;

  bool _saving = false;
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  String _message = '';

  @override
  void initState() {
    super.initState();
    print(widget.roleId);
  }

  //Login Educator to from API and Firebase
  Future<void> loginEducator() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.loginEduc(context, _email, _password);
      await Provider.of<AuthProvider>(context).loginEducator(_email, _password);
    }
  }
  //Login Student to from API and Firebase
  Future<void> loginStudent() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.loginStud(context, _email, _password);
      await Provider.of<AuthProvider>(context).loginStudent(_email, _password);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => SignupScreen(roleId: widget.roleId,)
                  ));
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 18.0)),
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
      child:
//        ModalProgressHUD(
//        inAsyncCall: _saving,
//        child:
        Stack(
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
                                hintText: "Email address",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(padding: EdgeInsets.only(right: 20.0),
                              child: Text("Forgot Password",
                                style: TextStyle(color: Colors.black45),
                              )
                          )
                        ],
                      ),
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
                  onPressed: widget.roleId == '1' ? loginStudent : loginEducator,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  child: Text("Login", style: TextStyle(color: Colors.white70)),
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      //),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
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
//
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
//
//  Widget _buildForgotPasswordBtn() {
//    return Container(
//      alignment: Alignment.centerRight,
//      child: FlatButton(
//        onPressed: () => print('Forgot Password Button Pressed'),
//        padding: EdgeInsets.only(right: 0.0),
//        child: Text(
//          'Forgot Password?',
//          style: kLabelStyle,
//        ),
//      ),
//    );
//  }
//
//  Widget _buildRememberMeCheckbox() {
//    return Container(
//      height: 20.0,
//      child: Row(
//        children: <Widget>[
//          Theme(
//            data: ThemeData(unselectedWidgetColor: Colors.white),
//            child: Checkbox(
//              value: _rememberMe,
//              checkColor: Colors.green,
//              activeColor: Colors.white,
//              onChanged: (value) {
//                setState(() {
//                  _rememberMe = value;
//                });
//              },
//            ),
//          ),
//          Text(
//            'Remember me',
//            style: kLabelStyle,
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildLoginBtn() {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 25.0),
//      width: double.infinity,
//      child: RaisedButton(
//        elevation: 5.0,
//        onPressed: () => Navigator.pushReplacementNamed(context, HomeScreen.id),
//        padding: EdgeInsets.all(15.0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(30.0),
//        ),
//        color: Colors.white,
//        child: Text(
//          'LOGIN',
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
//  Widget _buildSignInWithText() {
//    return Column(
//      children: <Widget>[
//        Text(
//          '- OR -',
//          style: TextStyle(
//            color: Colors.white,
//            fontWeight: FontWeight.w400,
//          ),
//        ),
//        SizedBox(height: 20.0),
//        Text(
//          'Sign in with',
//          style: kLabelStyle,
//        ),
//      ],
//    );
//  }
//
//  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        height: 60.0,
//        width: 60.0,
//        decoration: BoxDecoration(
//          shape: BoxShape.circle,
//          color: Colors.white,
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black26,
//              offset: Offset(0, 2),
//              blurRadius: 6.0,
//            ),
//          ],
//          image: DecorationImage(
//            image: logo,
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildSocialBtnRow() {
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 30.0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          _buildSocialBtn(
//                () => print('Login with Facebook'),
//            AssetImage(
//              'assets/images/facebook.jpg',
//            ),
//          ),
//          _buildSocialBtn(
//                () => print('Login with Google'),
//            AssetImage(
//              'assets/images/google.jpg',
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildSignupBtn() {
//    return GestureDetector(
//      onTap: () => Navigator.pushReplacementNamed(context, SignupScreen.id),
//      child: RichText(
//        text: TextSpan(
//          children: [
//            TextSpan(
//              text: 'Don\'t have an Account? ',
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18.0,
//                fontWeight: FontWeight.w400,
//              ),
//            ),
//            TextSpan(
//              text: 'Sign Up',
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18.0,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
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
//                        'Sign In',
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
//                      _buildForgotPasswordBtn(),
//                      _buildRememberMeCheckbox(),
//                      _buildLoginBtn(),
//                      _buildSignInWithText(),
//                      _buildSocialBtnRow(),
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
