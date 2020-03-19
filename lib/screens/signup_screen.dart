import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/providers/auth_providers.dart';
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
  final _formKey = GlobalKey<ScaffoldState>();
  String _email, _password;
  String _message = '';

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController = new TextEditingController(text: "");

  TextEditingController confirmPasswordController = new TextEditingController(text: "");

//------------------------------------------------------------------------------
  bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool readTerms = false;

  void _onReadTermsChanged(bool newValue) => setState(() {
    readTerms = newValue;

    if (readTerms) {
      // TODO: Here goes your functionality that remembers the user.
      newValue = true;
    } else {
      // TODO: Forget the user
      newValue = false;
    }
  });

  Map response = new Map();

  final image = "assets/images/the_yes_logo.png";

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
          Icons.check,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
        onPressed: _registerButtonAction,
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
//------------------------------------------------------------------------------
                  _passwordContainer(),
//------------------------------------------------------------------------------
                  _confirmPasswordContainer(),
//------------------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
//------------------------------------------------------------------------------
                        _termsConditionCheckBox(),
//------------------------------------------------------------------------------
                        _termsConditionLabel(),
                      ],
                    ),
                  ),
//------------------------------------------------------------------------------
                ],
              )
          )
      ),
      margin: EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
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
        margin: EdgeInsets.only(bottom: 20.0));
  }

  //------------------------------------------------------------------------------
  Widget _confirmPasswordContainer() {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
          controller: confirmPasswordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              border: InputBorder.none,
              hintText: Texts.CONFIRM_PASSWORD),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 12.0));
  }

//------------------------------------------------------------------------------
  Widget _termsConditionLabel() {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
          child: new Text(
            Texts.TERMS_CONDITION,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  //------------------------------------------------------------------------------
  Widget _termsConditionCheckBox() {
    return new Container(
        child: Checkbox(
          value: readTerms,
          onChanged: _onReadTermsChanged,
        ),
        margin: EdgeInsets.only(bottom: 30.0));
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
//  void checkUserId(){
//    if (widget.roleId == '1'){
//      _registerUserEducator();
//    }else if (widget.roleId == '2'){
//      _registerUserStudent();
//    }
//  }

//------------------------------------------------------------------------------
  void _registerButtonAction() {
    if (emailController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (!isValidEmail(emailController.text)) {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_VALID_MAIL),
      ));
      return;
    }

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

    if (confirmPasswordController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_CON_PASS),
      ));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.PASSWORD_NOT_MATCH),
      ));
      return;
    }

    if (readTerms == false){
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.TERMS_CONDITION),
      ));
      return;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    _registerUser(
        emailController.text, passwordController.text);
  }

  //------------------------------------------------------------------------------
  void _registerUser( String email, String password) async {
    EventObject eventObject = await AuthProvider().registerUser( email, password);
    switch (eventObject.id) {
      case EventConstants.USER_REGISTRATION_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToLoginScreen();
          });
        }
        break;
      case EventConstants.USER_ALREADY_REGISTERED:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.USER_ALREADY_REGISTERED),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.USER_REGISTRATION_UN_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_UN_SUCCESSFUL),
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

  void _goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new LoginScreen()),
    );
  }
//------------------------------------------------------------------------------

}
