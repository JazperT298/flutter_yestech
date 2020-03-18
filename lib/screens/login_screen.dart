import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/signup_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:flutter_yestech/utils/constant.dart';
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
  final _formKey = GlobalKey<ScaffoldState>();

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController = new TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    print(widget.roleId);
  }
  //------------------------------------------------------------------------------
  Widget _buildPageContent(BuildContext context) {
    return new Scaffold(
        key: _formKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            _loginContainer(),
            progressDialog
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.arrow_forward_ios,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
        onPressed: _loginButtonAction,
      ),
    );
  }

  //------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
      decoration: BoxDecoration(color: Colors.white),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/the_yes_logo.png'),
                  height: 140.0,
                  width: 140.0,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.green,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
//------------------------------------------------------------------------------
                        _formContainer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(primarySwatch: Colors.pink),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _emailContainer(),
////------------------------------------------------------------------------------
                  _passwordContainer(),
////------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
//------------------------------------------------------------------------------
                      Expanded(
                          child: _forgotPasswordLabel()
                      ),
//------------------------------------------------------------------------------
                      _registerNowLabel(),
                    ],
                  ),
                ),
                ],
              )
          )
      ),
      margin: EdgeInsets.only(top: 140.0, left: 16.0, right: 16.0),
    );
  }

  //------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                suffixIcon: new Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
              border: InputBorder.none,
              hintText: Texts.EMAIL,
            ),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 20.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              border: InputBorder.none,
              hintText: Texts.PASSWORD),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 12.0));
  }

//------------------------------------------------------------------------------
  Widget _loginButtonContainer() {
    return new Container(
        width: double.infinity,
        decoration: new BoxDecoration(color: Colors.blue[400]),
        child: new MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          onPressed: () {},
          child: new Text(
            Texts.LOGIN,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------
  Widget _registerNowLabel() {
    return new GestureDetector(
      onTap: _goToRegisterScreen,
      child: new Container(
          child: new Text(
            Texts.REGISTER_NOW,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  //------------------------------------------------------------------------------
  Widget _forgotPasswordLabel() {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
          child: new Text(
            Texts.FORGOT_PASSWORD,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

//------------------------------------------------------------------------------
//  void _goToHomeScreen() {
//    Navigator.pushReplacement(
//      context,
//      new MaterialPageRoute(builder: (context) => new HomePage()),
//    );
//  }

//------------------------------------------------------------------------------
  void _goToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }

  //------------------------------------------------------------------------------
  void _loginButtonAction() {
    if (emailController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (passwordController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    _loginUser(emailController.text, passwordController.text);
  }

  //------------------------------------------------------------------------------
  void _loginUser(String id, String password) async {
    EventObject eventObject = await AuthProvider().loginUser(id, password);
    switch (eventObject.id) {
      case EventConstants.LOGIN_USER_SUCCESSFUL:
        {
          setState(() {
            AppSharedPreferences.setUserLoggedIn(true);
            AppSharedPreferences.setUserProfile(eventObject.object);
            //getUsersDetail();
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToHomeScreen();
          });
        }
        break;
      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }

//------------------------------------------------------------------------------
  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new HomeScreen()),
    );
  }

//------------------------------------------------------------------------------


}
